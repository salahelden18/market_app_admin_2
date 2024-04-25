import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/core/utils/dialog_manager_overlay.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/text_button_widget.dart';
import '../../data/models/category_request_model.dart';
import '../../../../core/utils/show_toast.dart';
import '../../../../core/widgets/text_form_field_widget.dart';
import '../../data/models/category_response_model.dart';
import '../model_views/categories_cubit.dart';
import 'widgets/add_edit_button.dart';
import 'widgets/edit_add_image_widget.dart';

import '../../../../core/services/asset_picker_service.dart';

class AddEditCategoryScreen extends StatefulWidget {
  const AddEditCategoryScreen({super.key});
  static const String routeName = "/add-edit_category";

  @override
  State<AddEditCategoryScreen> createState() => _AddEditCategoryScreenState();
}

class _AddEditCategoryScreenState extends State<AddEditCategoryScreen> {
  CategoryResponseModel? category;
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController trNameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  File? pickedImage;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category =
        ModalRoute.of(context)?.settings.arguments as CategoryResponseModel?;

    if (category != null) {
      enNameController.text = category?.enName ?? '';
      trNameController.text = category?.trName ?? '';
      arNameController.text = category?.enName ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    enNameController.dispose();
    arNameController.dispose();
    trNameController.dispose();
  }

  Future pickImage() async {
    var result = await AssetPickerService.pickImage();
    if (result != null) {
      setState(() {
        pickedImage = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${category == null ? 'Add' : 'Edit'} Category'),
        actions: [
          if (category != null)
            TextButtonWidget(
              onPressed: () async {
                DialogManagerOverlay.showDialogWithMessage(context);

                var result = await context
                    .read<CategoriesCubit>()
                    .deleteCategory(category!.id);

                DialogManagerOverlay.closeDialog();

                if (context.mounted) {
                  if (result != null) {
                    showToast(context: context, msg: result);
                  } else {
                    Navigator.pop(context);
                  }
                }
              },
              title: 'Delete',
              textColor: AppColors.errorColor,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            EditAddImageWidget(
              category: category,
              pickImageFn: pickImage,
              pickedImage: pickedImage,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'English Name ',
                    controller: enNameController,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Turkish Name ',
                    controller: trNameController,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Arabic Name ',
                    controller: arNameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isLoading
                ? const LoadingWidget()
                : AddEditButtonWidget(
                    category: category,
                    onTap: onTap,
                  ),
          ],
        ),
      ),
    );
  }

  Future onTap() async {
    var categoryRequestModel = CategoryRequestModel(
      arName: arNameController.text,
      enName: enNameController.text,
      image: pickedImage,
      trName: trNameController.text,
    );

    if (categoryRequestModel.arName!.isEmpty ||
        categoryRequestModel.enName.isEmpty ||
        categoryRequestModel.trName!.isEmpty) {
      showToast(context: context, msg: 'Please fill all the fields');
      return;
    }

    // if the category is equals to null that means we trying to add new category and it should not be null
    if (category == null && pickedImage == null) {
      showToast(context: context, msg: 'Please pick an image for the category');
      return;
    }

    String? result;
    // for adding the new category
    setState(() {
      isLoading = true;
    });
    if (category == null) {
      result = await context
          .read<CategoriesCubit>()
          .addNewCategory(categoryRequestModel);
    } else {
      // for updating the category
      result = await context
          .read<CategoriesCubit>()
          .updateCategory(category!.id, categoryRequestModel);
    }

    setState(() {
      isLoading = false;
    });

    if (result != null) {
      // ignore: use_build_context_synchronously
      showToast(context: context, msg: result);
    } else {
      Navigator.pop(context);
    }
  }
}
