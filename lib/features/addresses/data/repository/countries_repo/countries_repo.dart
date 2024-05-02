import 'package:dartz/dartz.dart';
import '../../../../../core/error/http_failure.dart';
import '../../models/country_request_model.dart';
import '../../models/country_model.dart';

abstract class CountriesRepo {
  Future<Either<HttpFailure, List<CountryModel>?>> getCountries();
  Future<Either<HttpFailure, CountryModel?>> addCountry(
      {required CountryRequestModel addAddressModel});
  Future<Either<HttpFailure, dynamic>> deleteCountry(String countryId);
  Future<Either<HttpFailure, CountryModel?>> updateAddress(
      String countryId, CountryRequestModel addAddressModel);
}
