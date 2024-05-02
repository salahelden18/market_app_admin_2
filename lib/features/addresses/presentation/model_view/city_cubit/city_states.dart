import 'package:equatable/equatable.dart';

import '../../../data/models/common_model.dart';

class CityStates extends Equatable {
  const CityStates();

  @override
  List<Object> get props => [];
}

class CityInitialState extends CityStates {}

class CityLoadingState extends CityStates {}

class CitySuccessState extends CityStates {
  final List<CommonModel> cities;

  const CitySuccessState(this.cities);

  @override
  List<Object> get props => [cities];
}

class CityFailureState extends CityStates {
  final String errorMessage;

  const CityFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
