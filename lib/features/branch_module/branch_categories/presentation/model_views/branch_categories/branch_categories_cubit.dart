import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../data/models/branch_category_model.dart';
import '../../../../../../main.dart';
import '../../../data/models/branch_category_request_model.dart';
import '../../../data/repo/branch_categories_repo.dart';
import 'branch_categories_states.dart';

class BranchCategoriesCubit extends Cubit<BranchCategoriesStates> {
  BranchCategoriesCubit(this._branchCategoriesRepo)
      : super(BranchCategoriesInitialState());

  final BranchCategoriesRepo _branchCategoriesRepo;
  List<BranchCategoryModel> branchCategories = [];

  Future getBranchCategories(String branchId) async {
    emit(BranchCategoriesLoadingState());

    var result = await _branchCategoriesRepo.getBranchCategories(branchId);

    result.fold(
      (l) => emit(BranchCategoriesFailureState(l.message)),
      (r) {
        branchCategories = r!;
        emit(BranchCategoriesSuccessState(r));
      },
    );
  }

  Future addBranchCategory(String branchId,
      BranchCategoryRequestModel branchCategoryRequestModel) async {
    var result = await _branchCategoriesRepo.addBranchCategory(
        branchId, branchCategoryRequestModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        branchCategories = List<BranchCategoryModel>.from(branchCategories)
          ..add(r!);

        emit(BranchCategoriesSuccessState(branchCategories));
      },
    );
  }

  Future toggleBranchCategory(int id) async {
    var result = await _branchCategoriesRepo.toggleBranchCategory(id);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        final updatedItemIndex =
            branchCategories.indexWhere((element) => element.id == id);
        if (updatedItemIndex != -1) {
          final updatedItem = branchCategories[updatedItemIndex].copyWith(
              isEnabled: !branchCategories[updatedItemIndex].isEnabled!);
          final updatedCategories = List.of(branchCategories); // Create a copy
          updatedCategories[updatedItemIndex] = updatedItem;
          branchCategories = updatedCategories;
          emit(BranchCategoriesSuccessState(branchCategories));
        } else {
          showToast(
              context: navigatorKey.currentState!.context,
              msg: 'Branch category not found');
        }
      },
    );
  }
}
