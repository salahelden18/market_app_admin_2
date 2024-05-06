import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/dialog_manager_overlay.dart';
import '../../model_views/branch_sub_category/branch_subcategory_cubit.dart';
import '../../../../../../core/style/app_colors.dart';
import '../../../../../../core/widgets/text_button_widget.dart';
import '../../../data/models/branch_subcategory_model.dart';

class BranchSubcategoryItemWidget extends StatelessWidget {
  const BranchSubcategoryItemWidget(
      {super.key, required this.branchSubCategoryModel});
  final BranchSubCategoryModel branchSubCategoryModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(branchSubCategoryModel.subCategory.enName ?? ''),
      trailing: TextButtonWidget(
        onPressed: () async {
          DialogManagerOverlay.showDialogWithMessage(context);
          await context
              .read<BranchSubCategoryCubit>()
              .toggleBranchSubCategory(branchSubCategoryModel.id);
          DialogManagerOverlay.closeDialog();
        },
        title: branchSubCategoryModel.isEnabled ? 'Disable' : 'Enable',
        textColor: branchSubCategoryModel.isEnabled
            ? AppColors.errorColor
            : AppColors.primaryColor,
      ),
    );
  }
}
