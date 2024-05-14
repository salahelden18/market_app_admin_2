import 'package:equatable/equatable.dart';

import '../../../data/models/unadded_product_model.dart';

abstract class UnAddedProductsStates extends Equatable {
  const UnAddedProductsStates();

  @override
  List<Object> get props => [];
}

class UnAddedProductsInitialState extends UnAddedProductsStates {}

class UnAddedProductsLoadingState extends UnAddedProductsStates {}

class UnAddedProductsSuccessState extends UnAddedProductsStates {
  final List<UnAddedProductModel> products;

  const UnAddedProductsSuccessState(this.products);

  @override
  List<Object> get props => [products];
}

class UnAddedProductsFailureState extends UnAddedProductsStates {
  final String errorMessage;

  const UnAddedProductsFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
