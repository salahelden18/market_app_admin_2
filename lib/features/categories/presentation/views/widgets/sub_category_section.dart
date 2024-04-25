import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/show_modal_sheet.dart';
import 'package:market_app_web_2/features/categories/presentation/views/widgets/subcategory_modal_sheet_widget.dart';
import '../../../../../core/style/font_style.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/text_button_widget.dart';
import 'sub_category_item_widget.dart';
import '../../model_views/subcategory/subcategory_cubit.dart';
import '../../model_views/subcategory/subcategory_states.dart';

class SubCategorySection extends StatelessWidget {
  const SubCategorySection({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryStates>(
      builder: (ctx, state) {
        if (state is SubCategoryLoadingState) {
          return const LoadingWidget();
        } else if (state is SubCategorySuccessState) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Subcategories', style: FontStyle.size22Black600),
                  TextButtonWidget(
                    onPressed: () async {
                      await showModalSheet(
                        context,
                        SubCategoryModalSheetWidget(
                          subCategory: null,
                          categoryId: categoryId,
                        ),
                      );
                    },
                    title: 'Add new subcategory',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              state.subCategory.isEmpty
                  ? const Center(
                      child: Text(
                          'you don\'t have any subcategory for this category'),
                    )
                  : Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      children: state.subCategory
                          .map(
                            (e) => SubcategoryItemWidget(
                              subcategory: e,
                              categoryId: categoryId,
                            ),
                          )
                          .toList(),
                    ),
            ],
          );
        } else {
          final errorMessage =
              state is SubCategoryFailureState ? state.errorMessage : 'Error';

          return Center(
            child: Text(errorMessage),
          );
        }
      },
    );
  }
}
