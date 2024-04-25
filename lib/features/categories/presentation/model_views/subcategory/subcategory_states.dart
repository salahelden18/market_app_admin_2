import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_response.dart';

abstract class SubCategoryStates extends Equatable {
  const SubCategoryStates();

  @override
  List<Object> get props => [];
}

class SubCategoryInitialState extends SubCategoryStates {}

class SubCategoryLoadingState extends SubCategoryStates {}

class SubCategorySuccessState extends SubCategoryStates {
  final List<SubCategoryResponseModel> subCategory;

  const SubCategorySuccessState(this.subCategory);

  @override
  List<Object> get props => [subCategory];
}

class SubCategoryFailureState extends SubCategoryStates {
  final String errorMessage;

  const SubCategoryFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
