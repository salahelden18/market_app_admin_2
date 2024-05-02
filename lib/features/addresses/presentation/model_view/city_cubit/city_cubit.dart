import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/show_toast.dart';
import 'package:market_app_web_2/features/addresses/data/models/city_request_model.dart';
import 'package:market_app_web_2/main.dart';
import '../../../data/models/common_model.dart';
import '../../../data/repository/countries_repo/address_repo.dart';
import 'city_states.dart';

class CityCubit extends Cubit<CityStates> {
  CityCubit(this._countriesRepo) : super(CityInitialState());
  final AddressRepo _countriesRepo;

  List<CommonModel> cities = [];

  Future getCities(String countryId) async {
    emit(CityLoadingState());
    var result = await _countriesRepo.getCities(countryId);

    result.fold(
      (l) => emit(CityFailureState(l.message)),
      (r) {
        cities = r!;
        emit(CitySuccessState(r));
      },
    );
  }

  Future addCity(CityRequetsModel cityModel) async {
    var result = await _countriesRepo.addCity(cityModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null) {
          cities = List<CommonModel>.from(cities)..add(r);

          emit(CitySuccessState(cities));
        }
      },
    );
  }

  Future updateCity(String cityId, CityRequetsModel cityRequetsModel) async {
    var result = await _countriesRepo.updateCity(cityId, cityRequetsModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null) {
          cities = cities.map((category) {
            return category.id == cityId ? r : category;
          }).toList();

          emit(CitySuccessState(cities));
        }
      },
    );
  }

  Future deleteCity(String cityId) async {
    var result = await _countriesRepo.deleteCity(cityId);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        cities = List<CommonModel>.from(cities)
          ..removeWhere((element) => element.id == cityId);

        emit(CitySuccessState(cities));
      },
    );
  }
}
