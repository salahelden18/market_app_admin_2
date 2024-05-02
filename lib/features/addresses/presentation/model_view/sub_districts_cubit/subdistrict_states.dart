import 'package:equatable/equatable.dart';

import '../../../data/models/common_model.dart';

class SubDistrictStates extends Equatable {
  const SubDistrictStates();

  @override
  List<Object> get props => [];
}

class SubDistrictInitialState extends SubDistrictStates {}

class SubDistrictLoadingState extends SubDistrictStates {}

class SubDistrictSuccessState extends SubDistrictStates {
  final List<CommonModel> subdistricts;

  const SubDistrictSuccessState(this.subdistricts);

  @override
  List<Object> get props => [subdistricts];
}

class SubDistrictFailureState extends SubDistrictStates {
  final String errorMessage;

  const SubDistrictFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
