import 'package:equatable/equatable.dart';

import '../../../data/models/branch_subcategory_model.dart';

abstract class BranchSubCategoryStates extends Equatable {
  const BranchSubCategoryStates();

  @override
  List<Object> get props => [];
}

class BranchSubCategoryInitialState extends BranchSubCategoryStates {}

class BranchSubCategoryLoadingState extends BranchSubCategoryStates {}

class BranchSubCategorySuccessState extends BranchSubCategoryStates {
  final List<BranchSubCategoryModel> branchSubcategoreis;

  const BranchSubCategorySuccessState(this.branchSubcategoreis);

  @override
  List<Object> get props => [branchSubcategoreis];
}

class BranchSubCategoryFailureState extends BranchSubCategoryStates {
  final String errorMessage;

  const BranchSubCategoryFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
