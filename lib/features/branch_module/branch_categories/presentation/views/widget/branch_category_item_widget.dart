import 'package:flutter/material.dart';
import '../../../data/models/branch_category_model.dart';

import '../../../../../../core/style/app_colors.dart';
import '../../../../../categories/presentation/views/widgets/category_item_widget.dart';

class BranchCategoryItemWidget extends StatelessWidget {
  const BranchCategoryItemWidget({super.key, required this.branchCategory});
  final BranchCategoryModel branchCategory;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CategoryItemWidget(category: branchCategory.category!),
        if (branchCategory.isEnabled == false)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                color: AppColors.errorColor,
              ),
              child: const Text(
                'Disabled',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
