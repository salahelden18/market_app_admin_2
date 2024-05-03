import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/error/http_failure.dart';
import 'package:market_app_web_2/features/banners/data/models/banner_model.dart';

abstract class BannerRepo {
  Future<Either<HttpFailure, List<BannerModel>?>> getBanners();
}
