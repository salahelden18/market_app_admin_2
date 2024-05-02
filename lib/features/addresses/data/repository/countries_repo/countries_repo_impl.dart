import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/constants/endpoint_constants.dart';
import 'package:market_app_web_2/core/error/http_failure.dart';
import 'package:market_app_web_2/core/services/http_service_interface.dart';
import 'package:market_app_web_2/features/addresses/data/models/add_address_model.dart';
import 'package:market_app_web_2/features/addresses/data/models/address_model.dart';
import 'package:market_app_web_2/features/addresses/data/repository/countries_repo/countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  final HttpServiceInterface _httpServiceInterface;

  const CountriesRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, List<AddressModel>?>> getCountries() async {
    return await _httpServiceInterface.get(
        url: EndpointConstants.countries,
        fromJson: (decodedJson) => List<AddressModel>.from(
            decodedJson.map((e) => AddressModel.fromJson(e))));
  }

  @override
  Future<Either<HttpFailure, AddressModel?>> addCountry(
      {required AddAddressModel addAddressModel}) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.countries,
      fromJson: (decodedJson) => AddressModel.fromJson(decodedJson),
      body: addAddressModel.toJson(),
    );
  }
}
