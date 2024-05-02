import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/constants/endpoint_constants.dart';
import 'package:market_app_web_2/core/error/http_failure.dart';
import 'package:market_app_web_2/core/services/http_service_interface.dart';
import 'package:market_app_web_2/features/addresses/data/models/country_request_model.dart';
import 'package:market_app_web_2/features/addresses/data/models/country_model.dart';
import 'package:market_app_web_2/features/addresses/data/repository/countries_repo/countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  final HttpServiceInterface _httpServiceInterface;

  const CountriesRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, List<CountryModel>?>> getCountries() async {
    return await _httpServiceInterface.get(
        url: EndpointConstants.countries,
        fromJson: (decodedJson) => List<CountryModel>.from(
            decodedJson.map((e) => CountryModel.fromJson(e))));
  }

  @override
  Future<Either<HttpFailure, CountryModel?>> addCountry(
      {required CountryRequestModel addAddressModel}) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.countries,
      fromJson: (decodedJson) => CountryModel.fromJson(decodedJson),
      body: addAddressModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> deleteCountry(String countryId) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.countries}/$countryId',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, CountryModel?>> updateAddress(
      String countryId, CountryRequestModel addAddressModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.countries}/$countryId',
      fromJson: (decodedJson) => CountryModel.fromJson(decodedJson),
      body: addAddressModel.toJson(),
    );
  }
}
