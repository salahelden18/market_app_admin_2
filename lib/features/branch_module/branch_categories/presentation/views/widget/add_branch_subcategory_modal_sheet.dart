import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';
import '../../../data/models/branch_category_model.dart';
import '../../../data/models/branch_subcategory_request_model.dart';
import '../../model_views/branch_sub_category/branch_subcategory_cubit.dart';
import '../../../../../categories/presentation/model_views/subcategory/subcategory_cubit.dart';
import '../../../../../categories/presentation/model_views/subcategory/subcategory_states.dart';

class AddBranchSubcategoryModalSheetWidget extends StatefulWidget {
  const AddBranchSubcategoryModalSheetWidget(
      {super.key, required this.branchCategory});
  final BranchCategoryModel branchCategory;

  @override
  State<AddBranchSubcategoryModalSheetWidget> createState() =>
      _AddBranchSubcategoryModalSheetWidgetState();
}

class _AddBranchSubcategoryModalSheetWidgetState
    extends State<AddBranchSubcategoryModalSheetWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<SubCategoryCubit>()
        .getSubCategories(widget.branchCategory.categoryId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryStates>(
        builder: (context, state) {
      if (state is SubCategoryLoadingState) {
        return const SizedBox(
            width: double.infinity,
            child: Text(
              'loading...',
              textAlign: TextAlign.center,
            ));
      } else if (state is SubCategorySuccessState) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: DropdownButtonFormFieldWidget(
            items: state.subCategory
                .map(
                  (e) => DropdownMenuItem(
                    value: e.id,
                    child: Text(e.enName ?? ''),
                  ),
                )
                .toList(),
            onChanged: (value) async {
              DialogManagerOverlay.showDialogWithMessage(context);
              await context.read<BranchSubCategoryCubit>().addBranchSubCatgeory(
                    BranchSubcategoryRequestModel(
                      branchCategoryId: widget.branchCategory.id,
                      branchId: widget.branchCategory.branchId!,
                      categoryId: widget.branchCategory.categoryId!,
                      subCategoryId: value,
                    ),
                  );
              DialogManagerOverlay.closeDialog();
            },
            hint: 'Select Sub category',
          ),
        );
      } else {
        final errorMessage =
            state is SubCategoryFailureState ? state.errorMessage : 'Error';
        return Center(
          child: Text(errorMessage),
        );
      }
    });
  }
}
