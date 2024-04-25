import 'package:equatable/equatable.dart';

import '../../data/models/category_response_model.dart';

abstract class CategoriesStates extends Equatable {
  const CategoriesStates();

  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  final List<CategoryResponseModel> categories;

  const CategoriesSuccessState(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesFailureState extends CategoriesStates {
  final String errorMessage;

  const CategoriesFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
