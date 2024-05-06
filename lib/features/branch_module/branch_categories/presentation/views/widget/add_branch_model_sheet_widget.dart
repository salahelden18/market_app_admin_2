import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import '../../../data/models/branch_category_request_model.dart';
import '../../model_views/branch_categories/branch_categories_cubit.dart';
import '../../../../../categories/presentation/model_views/categories_cubit.dart';
import '../../../../../categories/presentation/model_views/categories_states.dart';
import '../../../../../addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';

class AddBranchModalSheetWidget extends StatefulWidget {
  const AddBranchModalSheetWidget({super.key});

  @override
  State<AddBranchModalSheetWidget> createState() =>
      _AddBranchModalSheetWidgetState();
}

class _AddBranchModalSheetWidgetState extends State<AddBranchModalSheetWidget> {
  @override
  void initState() {
    super.initState();
    if (context.read<CategoriesCubit>().state is! CategoriesSuccessState) {
      context.read<CategoriesCubit>().getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const Center(
            child: Text('loading'),
          );
        } else if (state is CategoriesSuccessState) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: DropdownButtonFormFieldWidget(
              items: state.categories
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.enName ?? ''),
                    ),
                  )
                  .toList(),
              onChanged: (value) async {
                DialogManagerOverlay.showDialogWithMessage(context);

                await context.read<BranchCategoriesCubit>().addBranchCategory(
                      context.read<SelectedBranchCubit>().state!.id,
                      BranchCategoryRequestModel(categoryId: value),
                    );

                DialogManagerOverlay.closeDialog();
              },
              hint: 'Select Category',
            ),
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
