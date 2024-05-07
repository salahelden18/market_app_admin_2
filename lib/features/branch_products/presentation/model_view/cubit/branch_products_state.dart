part of 'branch_products_cubit.dart';

class BranchProductsStates extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBranchProductsLoadingState extends BranchProductsStates {}

class GetBranchProductsSuccessState extends BranchProductsStates {}

class GetBranchProductsErrorState extends BranchProductsStates {
  final String errorMessage;
  GetBranchProductsErrorState (this.errorMessage);
}
