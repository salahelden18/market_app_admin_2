import 'package:equatable/equatable.dart';

import '../../../data/models/country_model.dart';

abstract class CountriesStates extends Equatable {
  const CountriesStates();

  @override
  List<Object> get props => [];
}

class CountriesInitialState extends CountriesStates {}

class CountriesLoadingState extends CountriesStates {}

class CountriesSuccessState extends CountriesStates {
  final List<CountryModel> countries;

  const CountriesSuccessState(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountriesFailureState extends CountriesStates {
  final String errorMessage;

  const CountriesFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
