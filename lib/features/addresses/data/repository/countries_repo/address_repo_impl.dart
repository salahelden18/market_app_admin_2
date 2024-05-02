import 'package:dartz/dartz.dart';
import '../../models/district_request_model.dart';
import '../../models/subdistrict_request_model.dart';
import '../../models/common_model.dart';
import '../../models/city_request_model.dart';
import '../../../../../core/constants/endpoint_constants.dart';
import '../../../../../core/error/http_failure.dart';
import '../../../../../core/services/http_service_interface.dart';
import '../../models/country_request_model.dart';
import '../../models/country_model.dart';
import 'address_repo.dart';

class AddressRepoImpl implements AddressRepo {
  final HttpServiceInterface _httpServiceInterface;

  const AddressRepoImpl(this._httpServiceInterface);

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
  Future<Either<HttpFailure, CountryModel?>> updateCountry(
      String countryId, CountryRequestModel addAddressModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.countries}/$countryId',
      fromJson: (decodedJson) => CountryModel.fromJson(decodedJson),
      body: addAddressModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, CommonModel?>> addCity(
      CityRequetsModel cityRequetsModel) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.cities,
      fromJson: (decodedJson) => CommonModel.fromJson(decodedJson),
      body: cityRequetsModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> deleteCity(String cityId) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.cities}/$cityId',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, List<CommonModel>?>> getCities(
      String countryId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.cities}/countries-cities/$countryId',
      fromJson: (decodedJson) => List<CommonModel>.from(
        decodedJson.map(
          (e) => CommonModel.fromJson(e),
        ),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, CommonModel?>> updateCity(
      String cityId, CityRequetsModel cityRequetsModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.cities}/$cityId',
      fromJson: (decodedJson) => CommonModel.fromJson(decodedJson),
      body: cityRequetsModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, CommonModel?>> addDistrict(
      DistrictRequestModel districtRequestModel) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.district,
      fromJson: (decondedJson) => CommonModel.fromJson(decondedJson),
      body: districtRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, CommonModel?>> addSubDistrict(
      SubDistrictRequestModel subDistrictRequestModel) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.subDistrict,
      fromJson: (decodedJson) => CommonModel.fromJson(decodedJson),
      body: subDistrictRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> deleteDistrict(String districtId) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.district}/$districtId',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> deleteSubDistrict(
      String subDistrictId) async {
    return await _httpServiceInterface.post(
      url: '${EndpointConstants.subDistrict}/$subDistrictId',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, List<CommonModel>?>> getDistricts(
      String cityId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.district}/cities-districts/$cityId',
      fromJson: (decodedJson) => List<CommonModel>.from(
        decodedJson.map((e) => CommonModel.fromJson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, List<CommonModel>?>> getSubDistrict(
      String districtId) async {
    return await _httpServiceInterface.get(
      url:
          '${EndpointConstants.subDistrict}/districts-subdistricts/$districtId',
      fromJson: (decodedJson) => List<CommonModel>.from(
        decodedJson.map((e) => CommonModel.fromJson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, CommonModel?>> updateDistrict(
      String districtId, DistrictRequestModel districtRequestModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.district}/$districtId',
      fromJson: (decodedJson) => CommonModel.fromJson(decodedJson),
      body: districtRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, CommonModel?>> updateSubDistrict(
      String subDistrictId,
      SubDistrictRequestModel subDistrictRequestModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.subDistrict}/$subDistrictId',
      fromJson: (decodedJson) => CommonModel.fromJson(decodedJson),
      body: subDistrictRequestModel.toJson(),
    );
  }
}
