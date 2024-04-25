import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/utils/show_modal_sheet.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_response.dart';
import 'package:market_app_web_2/features/categories/presentation/views/widgets/subcategory_modal_sheet_widget.dart';

import '../../../../../core/style/app_colors.dart';

class SubcategoryItemWidget extends StatelessWidget {
  const SubcategoryItemWidget(
      {super.key, required this.subcategory, required this.categoryId});
  final SubCategoryResponseModel subcategory;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalSheet(
          context,
          SubCategoryModalSheetWidget(
              subCategory: subcategory, categoryId: categoryId),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(subcategory.enName ?? 'undefined'),
      ),
    );
  }
}
