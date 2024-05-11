part of 'branch_products_cubit.dart';

class BranchProductsStates extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBranchProductsLoadingState extends BranchProductsStates {}

class GetBranchProductsSuccessState extends BranchProductsStates {
  final List<BranchProductModel> branchProducts;  
  final PaginationModel paginationModel;
  GetBranchProductsSuccessState(this.branchProducts, this.paginationModel);
}

class GetBranchProductsErrorState extends BranchProductsStates {
  final String errorMessage;
  GetBranchProductsErrorState(this.errorMessage);
}
