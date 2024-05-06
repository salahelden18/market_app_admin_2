import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/dialog_manager_overlay.dart';
import 'package:market_app_web_2/core/widgets/text_button_widget.dart';
import 'package:market_app_web_2/features/branch_module/branch_categories/presentation/model_views/branch_categories/branch_categories_cubit.dart';
import '../../../../../core/utils/show_modal_sheet.dart';
import 'widget/add_branch_subcategory_modal_sheet.dart';
import 'widget/branch_subcategory_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../model_views/branch_sub_category/branch_subcategory_cubit.dart';
import '../model_views/branch_sub_category/branch_subcategory_states.dart';
import '../../data/models/branch_category_model.dart';

class BranchSubCategoriesScreen extends StatefulWidget {
  const BranchSubCategoriesScreen({super.key});
  static const String routeName = '/branch-sub-category-screen';

  @override
  State<BranchSubCategoriesScreen> createState() =>
      _BranchSubCategoriesScreenState();
}

class _BranchSubCategoriesScreenState extends State<BranchSubCategoriesScreen> {
  bool isExecuted = false;
  late BranchCategoryModel branchCategory;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!isExecuted) {
      branchCategory =
          ModalRoute.of(context)?.settings.arguments as BranchCategoryModel;
      context
          .read<BranchSubCategoryCubit>()
          .getBranchSubcategories(branchCategory.id);
      isExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(branchCategory.category?.enName ?? 'Branch Sub category'),
        actions: [
          IconButton(
            onPressed: () {
              showModalSheet(
                context,
                AddBranchSubcategoryModalSheetWidget(
                    branchCategory: branchCategory),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<BranchSubCategoryCubit, BranchSubCategoryStates>(
        builder: (context, state) {
          if (state is BranchSubCategoryLoadingState) {
            return const LoadingWidget();
          } else if (state is BranchSubCategorySuccessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.branchSubcategoreis.length,
                    itemBuilder: (ctx, index) => BranchSubcategoryItemWidget(
                        branchSubCategoryModel:
                            state.branchSubcategoreis[index]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextButtonWidget(
                    onPressed: () async {
                      DialogManagerOverlay.showDialogWithMessage(context);
                      await context
                          .read<BranchCategoriesCubit>()
                          .toggleBranchCategory(branchCategory.id);
                      DialogManagerOverlay.closeDialog();
                    },
                    title: 'Toggle Category',
                  ),
                ),
              ],
            );
          } else {
            final errorMessage = state is BranchSubCategoryFailureState
                ? state.errorMessage
                : 'Error';

            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }
}
