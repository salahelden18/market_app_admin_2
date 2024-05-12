import 'package:equatable/equatable.dart';

import '../../../../../core/models/pagination_model.dart';
import '../../../data/models/branch_product_model.dart';

class BranchProductsStates extends Equatable {
  @override
  List<Object> get props => [];
}

class BranchProductsInitialState extends BranchProductsStates {}

class BranchProductsLoadingState extends BranchProductsStates {}

class BranchProductsSuccessState extends BranchProductsStates {
  final List<BranchProductModel> branchProducts;
  final PaginationModel paginationModel;
  BranchProductsSuccessState(this.branchProducts, this.paginationModel);
  @override
  List<Object> get props => [paginationModel, branchProducts];
}

class BranchProductsErrorState extends BranchProductsStates {
  final String errorMessage;
  BranchProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
