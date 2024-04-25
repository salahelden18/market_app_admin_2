part of 'countries_cubit.dart';

sealed class CountriesStates extends Equatable {
  const CountriesStates();

  @override
  List<Object> get props => [];
}

final class CountriesInitial extends CountriesStates {}

final class GetCountriesLoadingState extends CountriesStates {}

final class GetCountriesSuccessState extends CountriesStates {
  final List<AddressModel> countries;
  const GetCountriesSuccessState(this.countries);
}

final class GetCountriesFailureState extends CountriesStates {
  final String failureMessage;
  const GetCountriesFailureState(this.failureMessage);
}

final class AddCountryLoadingState extends CountriesStates {}

final class AddCountrySuccessState extends CountriesStates {}

final class AddCountryFailureState extends CountriesStates {
  final String failureMessage;
  const AddCountryFailureState(this.failureMessage);
}

final class EditCountryLoadingState extends CountriesStates {}

final class EditCountrySuccessState extends CountriesStates {}

final class EditCountryFailureState extends CountriesStates {
  final String failureMessage;
  const EditCountryFailureState(this.failureMessage);
}

final class DeleteCountryLoadingState extends CountriesStates {}

final class DeleteCountrySuccessState extends CountriesStates {}

final class DeleteCountryFailureState extends CountriesStates {
  final String failureMessage;
  const DeleteCountryFailureState(this.failureMessage);
}
