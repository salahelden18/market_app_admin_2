import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/error/http_failure.dart';
import 'package:market_app_web_2/features/addresses/data/models/add_address_model.dart';
import 'package:market_app_web_2/features/addresses/data/models/address_model.dart';

abstract class CountriesRepo {
  Future<Either<HttpFailure, List<AddressModel>?>> getCountries();
  Future<Either<HttpFailure, AddressModel?>> addCountry({
    required AddAddressModel addAddressModel,
  });
}
