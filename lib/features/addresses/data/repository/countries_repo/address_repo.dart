import 'package:dartz/dartz.dart';
import '../../models/district_request_model.dart';
import '../../models/subdistrict_request_model.dart';
import '../../models/common_model.dart';
import '../../models/city_request_model.dart';
import '../../../../../core/error/http_failure.dart';
import '../../models/country_request_model.dart';
import '../../models/country_model.dart';

abstract class AddressRepo {
  Future<Either<HttpFailure, List<CountryModel>?>> getCountries();
  Future<Either<HttpFailure, CountryModel?>> addCountry(
      {required CountryRequestModel addAddressModel});
  Future<Either<HttpFailure, dynamic>> deleteCountry(String countryId);
  Future<Either<HttpFailure, CountryModel?>> updateCountry(
      String countryId, CountryRequestModel addAddressModel);

  // cities

  Future<Either<HttpFailure, List<CommonModel>?>> getCities(String countryId);
  Future<Either<HttpFailure, CommonModel?>> addCity(
      CityRequetsModel cityRequetsModel);
  Future<Either<HttpFailure, dynamic>> deleteCity(String cityId);
  Future<Either<HttpFailure, CommonModel?>> updateCity(
      String cityId, CityRequetsModel cityRequetsModel);

  // districts
  Future<Either<HttpFailure, List<CommonModel>?>> getDistricts(String cityId);
  Future<Either<HttpFailure, CommonModel?>> addDistrict(
      DistrictRequestModel districtRequestModel);
  Future<Either<HttpFailure, dynamic>> deleteDistrict(String districtId);
  Future<Either<HttpFailure, CommonModel?>> updateDistrict(
      String districtId, DistrictRequestModel districtRequestModel);

  // sub districts
  Future<Either<HttpFailure, List<CommonModel>?>> getSubDistrict(
      String districtId);
  Future<Either<HttpFailure, CommonModel?>> addSubDistrict(
      SubDistrictRequestModel subDistrictRequestModel);
  Future<Either<HttpFailure, dynamic>> deleteSubDistrict(String subDistrictId);
  Future<Either<HttpFailure, CommonModel?>> updateSubDistrict(
      String subDistrictId, SubDistrictRequestModel subDistrictRequestModel);
}
