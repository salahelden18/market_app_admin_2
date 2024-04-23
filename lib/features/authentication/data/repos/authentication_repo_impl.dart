import 'package:dartz/dartz.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../models/authentication_model.dart';
import '../models/authentication_request_model.dart';
import 'authentication_repo.dart';

import '../../../../core/services/http_service_interface.dart';

class AuthenticationRepoImpl implements AuthenticatioRepo {
  const AuthenticationRepoImpl(this._httpService);

  final HttpServiceInterface _httpService;

  @override
  Future<Either<HttpFailure, AuthenticationModel?>> sigin(
      AuthenticationRequestModel authenticationRequestModel) async {
    return await _httpService.post(
      url: EndpointConstants.loginPath,
      fromJson: (decodedJson) => AuthenticationModel.fromJson(decodedJson),
      requireToken: false,
      body: authenticationRequestModel.toJson(),
    );
  }
}
