import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/branch_subcategory_request_model.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../../../../main.dart';
import '../../../data/models/branch_subcategory_model.dart';
import '../../../data/repo/branch_categories_repo.dart';
import 'branch_subcategory_states.dart';

class BranchSubCategoryCubit extends Cubit<BranchSubCategoryStates> {
  BranchSubCategoryCubit(this._branchCategoriesRepo)
      : super(BranchSubCategoryInitialState());

  final BranchCategoriesRepo _branchCategoriesRepo;
  List<BranchSubCategoryModel> branchSubCategories = [];

  Future getBranchSubcategories(int branchCategoryId) async {
    emit(BranchSubCategoryLoadingState());

    var result =
        await _branchCategoriesRepo.getBranchSubcategories(branchCategoryId);

    result.fold(
      (l) => emit(BranchSubCategoryFailureState(l.message)),
      (r) {
        branchSubCategories = r!;
        emit(BranchSubCategorySuccessState(branchSubCategories));
      },
    );
  }

  Future addBranchSubCatgeory(
      BranchSubcategoryRequestModel branchSubcategoryRequestModel) async {
    var result = await _branchCategoriesRepo
        .addBranchSubcategory(branchSubcategoryRequestModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        branchSubCategories =
            List<BranchSubCategoryModel>.from(branchSubCategories)..add(r!);

        emit(BranchSubCategorySuccessState(branchSubCategories));
      },
    );
  }

  Future toggleBranchSubCategory(int id) async {
    var result = await _branchCategoriesRepo.toggleBranchCategory(id);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        final updatedItemIndex =
            branchSubCategories.indexWhere((element) => element.id == id);
        if (updatedItemIndex != -1) {
          final updatedItem = branchSubCategories[updatedItemIndex].copyWith(
              isEnabled: !branchSubCategories[updatedItemIndex].isEnabled);
          final updatedCategories =
              List.of(branchSubCategories); // Create a copy
          updatedCategories[updatedItemIndex] = updatedItem;
          branchSubCategories = updatedCategories;
          emit(BranchSubCategorySuccessState(branchSubCategories));
        } else {
          showToast(
              context: navigatorKey.currentState!.context,
              msg: 'Branch category not found');
        }
      },
    );
  }
}
