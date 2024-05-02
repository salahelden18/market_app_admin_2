import 'package:dartz/dartz.dart';

import '../../../../core/error/http_failure.dart';
import '../models/statistics_model.dart';

abstract class HomeRepo {
  Future<Either<HttpFailure, List<StatisticsModel>?>> getStatistics();
}
