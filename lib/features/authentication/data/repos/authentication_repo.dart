import 'package:dartz/dartz.dart';
import '../../../../core/error/http_failure.dart';
import '../models/authentication_model.dart';
import '../models/authentication_request_model.dart';

abstract class AuthenticatioRepo {
  Future<Either<HttpFailure, AuthenticationModel?>> sigin(
      AuthenticationRequestModel authenticationRequestModel);
}
