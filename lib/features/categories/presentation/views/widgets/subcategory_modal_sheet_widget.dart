import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/core/utils/show_toast.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_request.dart';
import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/widgets/filled_button_widget.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../../data/models/subcategory_response.dart';
import '../../model_views/subcategory/subcategory_cubit.dart';

class SubCategoryModalSheetWidget extends StatefulWidget {
  const SubCategoryModalSheetWidget(
      {super.key, required this.subCategory, required this.categoryId});
  final SubCategoryResponseModel? subCategory;
  final String categoryId;

  @override
  State<SubCategoryModalSheetWidget> createState() =>
      _SubCategoryModalSheetWidgetState();
}

class _SubCategoryModalSheetWidgetState
    extends State<SubCategoryModalSheetWidget> {
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController trNameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.subCategory != null) {
      enNameController.text = widget.subCategory?.enName ?? '';
      trNameController.text = widget.subCategory?.trName ?? '';
      arNameController.text = widget.subCategory?.arName ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    enNameController.dispose();
    arNameController.dispose();
    trNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldWidget(
                  label: 'English Name',
                  controller: enNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Fill English Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormFieldWidget(
                  label: 'Turkish Name',
                  controller: trNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Fill Turkish Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormFieldWidget(
                  label: 'Arabic Name',
                  controller: arNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Fill Arabic Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FilledButtonWidget(
                        onPress: () async {
                          bool isValid = _formKey.currentState!.validate();
                          String? errorMessage;

                          if (isValid) {
                            // init the model
                            var subcategoryRequest = SubCategoryRequest(
                              arName: arNameController.text,
                              enName: enNameController.text,
                              trName: trNameController.text,
                              categoryId: widget.categoryId,
                            );

                            DialogManagerOverlay.showDialogWithMessage(context);
                            if (widget.subCategory == null) {
                              // add adding sub category
                              errorMessage = await context
                                  .read<SubCategoryCubit>()
                                  .addSubCategory(subcategoryRequest);
                            } else {
                              // updating sub category
                              errorMessage = await context
                                  .read<SubCategoryCubit>()
                                  .updateSubCategory(widget.subCategory!.id,
                                      subcategoryRequest);
                            }

                            DialogManagerOverlay.closeDialog();

                            if (context.mounted) {
                              if (errorMessage != null) {
                                showToast(context: context, msg: errorMessage);
                                return;
                              } else {
                                Navigator.pop(context);
                              }
                            }
                          }
                        },
                        widget:
                            Text(widget.subCategory == null ? 'Add' : 'Edit'),
                      ),
                    ),
                    if (widget.subCategory != null) const SizedBox(width: 10),
                    if (widget.subCategory != null)
                      Expanded(
                        child: FilledButtonWidget(
                          onPress: () async {
                            DialogManagerOverlay.showDialogWithMessage(context);

                            await context
                                .read<SubCategoryCubit>()
                                .deleteSubCategory(widget.subCategory!.id);
                            DialogManagerOverlay.closeDialog();
                            Navigator.pop(context);
                          },
                          widget: const Text('Delete'),
                          backgroundColor: AppColors.errorColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
