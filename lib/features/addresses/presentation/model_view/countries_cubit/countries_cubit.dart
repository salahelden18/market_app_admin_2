import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/addresses/data/models/add_address_model.dart';
import 'package:market_app_web_2/features/addresses/data/models/address_model.dart';
import 'package:market_app_web_2/features/addresses/data/repository/countries_repo/countries_repo_impl.dart';
import 'package:market_app_web_2/service_locator.dart';
part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesStates> {
  CountriesCubit() : super(CountriesInitial());

  final CountriesRepoImpl countriesRepoImpl = CountriesRepoImpl(sl());
  List<AddressModel> countries = [];

  getCountries() async {
    emit(GetCountriesLoadingState());

    var result = await countriesRepoImpl.getCountries();

    result.fold((left) => emit(GetCountriesFailureState(left.message)),
        (right) {
      emit(GetCountriesSuccessState(right!));
    });
  }

  addCountry({
    required AddAddressModel addAddressModel,
  }) async {
    emit(AddCountryLoadingState());

    var result =
        await countriesRepoImpl.addCountry(addAddressModel: addAddressModel);

    result.fold((left) => emit(AddCountryFailureState(left.message)), (right) {
      getCountries();
      emit(AddCountrySuccessState());
    });
  }
}
