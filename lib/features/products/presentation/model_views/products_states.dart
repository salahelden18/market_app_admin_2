import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/core/models/pagination_model.dart';
import 'package:market_app_web_2/features/products/data/models/product_model.dart';

abstract class ProductsStates extends Equatable {
  const ProductsStates();

  @override
  List<Object> get props => [];
}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<ProductModel> products;
  final PaginationModel pagination;

  const ProductsSuccessState(this.products, this.pagination);

  @override
  List<Object> get props => [products, pagination];
}

class ProductsFailureState extends ProductsStates {
  final String errorMessage;

  const ProductsFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
