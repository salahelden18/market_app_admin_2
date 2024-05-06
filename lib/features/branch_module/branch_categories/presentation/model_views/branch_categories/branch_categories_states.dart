import 'package:equatable/equatable.dart';

import '../../../data/models/branch_category_model.dart';

abstract class BranchCategoriesStates extends Equatable {
  const BranchCategoriesStates();

  @override
  List<Object> get props => [];
}

class BranchCategoriesInitialState extends BranchCategoriesStates {}

class BranchCategoriesLoadingState extends BranchCategoriesStates {}

class BranchCategoriesSuccessState extends BranchCategoriesStates {
  final List<BranchCategoryModel> branchCategories;

  const BranchCategoriesSuccessState(this.branchCategories);

  @override
  List<Object> get props => [branchCategories];
}

class BranchCategoriesFailureState extends BranchCategoriesStates {
  final String errorMessage;

  const BranchCategoriesFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
