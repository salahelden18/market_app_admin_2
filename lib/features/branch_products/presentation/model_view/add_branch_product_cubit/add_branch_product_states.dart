import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_model.dart';

abstract class AddBranchProductStates extends Equatable {
  const AddBranchProductStates();

  @override
  List<Object> get props => [];
}

class AddBranchProductInitialState extends AddBranchProductStates {}

class AddBranchProductLoadingState extends AddBranchProductStates {}

class AddBranchProductSuccessState extends AddBranchProductStates {
  final BranchProductModel branchProductModel;

  const AddBranchProductSuccessState(this.branchProductModel);

  @override
  List<Object> get props => [branchProductModel];
}

class AddBranchProductFailureState extends AddBranchProductStates {
  final String errorMessage;

  const AddBranchProductFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
