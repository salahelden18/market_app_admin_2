import 'package:dartz/dartz.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../models/statistics_model.dart';

import '../../../../core/services/http_service_interface.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  const HomeRepoImpl(this._httpServiceInterface);
  final HttpServiceInterface _httpServiceInterface;

  @override
  Future<Either<HttpFailure, List<StatisticsModel>?>> getStatistics() async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.statistics,
      fromJson: (decodedJson) => List<StatisticsModel>.from(
        decodedJson.map((e) => StatisticsModel.fromJson(e)),
      ),
    );
  }
}
