import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/categories/presentation/views/add_edit_category_screen.dart';

import '../../../../../core/widgets/loading_widget.dart';
import '../../model_views/categories_cubit.dart';
import '../../model_views/categories_states.dart';
import 'category_item_widget.dart';

class CategoriesListSection extends StatelessWidget {
  const CategoriesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 120,
            ),
            itemBuilder: (ctx, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AddEditCategoryScreen.routeName,
                    arguments: state.categories[index]);
              },
              child: CategoryItemWidget(
                category: state.categories[index],
              ),
            ),
            itemCount: state.categories.length,
          );
        } else if (state is CategoriesLoadingState) {
          return const LoadingWidget();
        } else {
          String errorMessage =
              state is CategoriesFailureState ? state.errorMessage : 'error';

          return Center(
            child: Text(errorMessage),
          );
        }
      },
    );
  }
}
