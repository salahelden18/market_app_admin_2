import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../data/models/country_model.dart';
import '../../../../../main.dart';
import '../../../data/repository/countries_repo/countries_repo.dart';
import '../../../data/models/country_request_model.dart';
import 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesStates> {
  CountriesCubit(this._countriesRepo) : super(CountriesInitialState());

  final CountriesRepo _countriesRepo;

  Future getCountries() async {
    emit(CountriesLoadingState());

    var result = await _countriesRepo.getCountries();

    result.fold(
      (left) => emit(CountriesFailureState(left.message)),
      (right) {
        emit(CountriesSuccessState(right!));
      },
    );
  }

  Future addCountry({
    required CountryRequestModel addAddressModel,
  }) async {
    var result =
        await _countriesRepo.addCountry(addAddressModel: addAddressModel);

    result.fold(
      // if failure show toast
      (left) {
        showToast(
          context: navigatorKey.currentState!.context,
          msg: left.message,
        );
      },
      (right) {
        if (state is CountriesSuccessState && right != null) {
          List<CountryModel> countries =
              (state as CountriesSuccessState).countries;
          countries = List<CountryModel>.from(countries)..add(right);

          emit(CountriesSuccessState(countries));
        }
      },
    );
  }

  Future updateAddress(
      String countryId, CountryRequestModel addAddressModel) async {
    var result = await _countriesRepo.updateAddress(countryId, addAddressModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (state is CountriesSuccessState && r != null) {
          List<CountryModel> countries =
              (state as CountriesSuccessState).countries;
          // Update the category in the list
          countries = countries.map((category) {
            return category.id == countryId ? r : category;
          }).toList();

          emit(CountriesSuccessState(countries));
        }
      },
    );
  }

  Future deleteCountry(String countryId) async {
    var result = await _countriesRepo.deleteCountry(countryId);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (state is CountriesSuccessState && r == null) {
          List<CountryModel> countries =
              (state as CountriesSuccessState).countries;
          countries = List<CountryModel>.from(countries)
            ..removeWhere((country) => country.id == countryId);

          emit(CountriesSuccessState(countries));
        }
      },
    );
  }
}
