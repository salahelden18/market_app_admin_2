import 'package:equatable/equatable.dart';

import '../../../data/models/common_model.dart';

class DistrictStates extends Equatable {
  const DistrictStates();

  @override
  List<Object> get props => [];
}

class DistrictInitialState extends DistrictStates {}

class DistrictLoadingState extends DistrictStates {}

class DistrictSuccessState extends DistrictStates {
  final List<CommonModel> districts;

  const DistrictSuccessState(this.districts);

  @override
  List<Object> get props => [districts];
}

class DistrictFailureState extends DistrictStates {
  final String errorMessage;

  const DistrictFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
