import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch_module/branch_categories/presentation/views/branch_sub_categories_screen.dart';
import '../../../../../core/utils/show_modal_sheet.dart';
import 'widget/add_branch_model_sheet_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../model_views/branch_categories/branch_categories_cubit.dart';
import '../model_views/branch_categories/branch_categories_states.dart';
import '../../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'widget/branch_category_item_widget.dart';

class BranchCategoryScreen extends StatefulWidget {
  const BranchCategoryScreen({super.key});
  static const String routeName = '/branch-category-screen';

  @override
  State<BranchCategoryScreen> createState() => _BranchCategoryScreenState();
}

class _BranchCategoryScreenState extends State<BranchCategoryScreen> {
  @override
  void initState() {
    super.initState();
    final branchId = context.read<SelectedBranchCubit>().state!.id;
    context.read<BranchCategoriesCubit>().getBranchCategories(branchId);
  }

  @override
  Widget build(BuildContext context) {
    final branch = context.read<SelectedBranchCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(branch.state?.enName ?? 'Branch Category'),
        actions: [
          IconButton(
            onPressed: () {
              showModalSheet(
                context,
                const AddBranchModalSheetWidget(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<BranchCategoriesCubit, BranchCategoriesStates>(
        builder: (context, state) {
          if (state is BranchCategoriesLoadingState) {
            return const LoadingWidget();
          } else if (state is BranchCategoriesSuccessState) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 120,
              ),
              itemCount: state.branchCategories.length,
              itemBuilder: (context, index) =>
                  state.branchCategories[index].category != null
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                BranchSubCategoriesScreen.routeName,
                                arguments: state.branchCategories[index]);
                          },
                          child: BranchCategoryItemWidget(
                            branchCategory: state.branchCategories[index],
                          ),
                        )
                      : const SizedBox(),
            );
          } else {
            final errorMessage = state is BranchCategoriesFailureState
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
