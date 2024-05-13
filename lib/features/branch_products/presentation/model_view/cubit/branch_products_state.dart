import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/branch_products/data/models/main_product_model.dart';

import '../../../../../core/models/pagination_model.dart';
import '../../../data/models/branch_product_model.dart';

class BranchProductsStates extends Equatable {
  @override
  List<Object> get props => [];

  const BranchProductsStates();
}

class BranchProductsInitialState extends BranchProductsStates {}

class BranchProductsLoadingState extends BranchProductsStates {}

class BranchProductsSuccessState extends BranchProductsStates {
  final List<BranchProductModel> branchProducts;
  final PaginationModel paginationModel;
  const BranchProductsSuccessState(this.branchProducts, this.paginationModel);
  @override
  List<Object> get props => [paginationModel, branchProducts];
}

class BranchProductsErrorState extends BranchProductsStates {
  final String errorMessage;
  const BranchProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class UnAddedProductsLoadingState extends BranchProductsStates {}

class UnAddedProductsSuccessState extends BranchProductsStates {
  final List<MainProductModel> products;
  const UnAddedProductsSuccessState(this.products);
  @override
  List<Object> get props => [products];
}

class UnAddedProductsErrorState extends BranchProductsStates {
  final String errorMessage;
  const UnAddedProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
