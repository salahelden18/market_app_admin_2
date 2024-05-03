import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';
import '../../../../categories/presentation/model_views/categories_cubit.dart';
import '../../../../categories/presentation/model_views/categories_states.dart';
import '../../../../categories/presentation/model_views/subcategory/subcategory_cubit.dart';
import '../../../../categories/presentation/model_views/subcategory/subcategory_states.dart';

class ProductCategorySection extends StatefulWidget {
  const ProductCategorySection({super.key, required this.selectSubCategory});
  final Function(String id) selectSubCategory;

  @override
  State<ProductCategorySection> createState() => _ProductCategorySectionState();
}

class _ProductCategorySectionState extends State<ProductCategorySection> {
  String? categoryId;

  @override
  Widget build(BuildContext context) {
    final categoryState = context.watch<CategoriesCubit>().state;
    final subCategoryState = context.watch<SubCategoryCubit>().state;
    return Column(
      children: [
        if (categoryState is CategoriesSuccessState) const SizedBox(height: 10),
        // the categories part
        if (categoryState is CategoriesSuccessState)
          DropdownButtonFormFieldWidget(
            items: List.generate(
              categoryState.categories.length,
              (index) => DropdownMenuItem(
                value: categoryState.categories[index].id,
                child: Text(categoryState.categories[index].enName ?? ''),
              ),
            ),
            onChanged: (value) async {
              DialogManagerOverlay.showDialogWithMessage(context);
              categoryId = value;
              await context.read<SubCategoryCubit>().getSubCategories(value);
              DialogManagerOverlay.closeDialog();
            },
            hint: 'Select Category',
          ),
        if (subCategoryState is SubCategorySuccessState && categoryId != null)
          const SizedBox(height: 10),
        if (subCategoryState is SubCategorySuccessState && categoryId != null)
          DropdownButtonFormFieldWidget(
            items: List.generate(
              subCategoryState.subCategory.length,
              (index) => DropdownMenuItem(
                value: subCategoryState.subCategory[index].id,
                child: Text(subCategoryState.subCategory[index].enName ?? ''),
              ),
            ),
            onChanged: (value) {
              widget.selectSubCategory(value);
            },
            hint: 'Select Sub Category',
          ),
      ],
    );
  }
}
