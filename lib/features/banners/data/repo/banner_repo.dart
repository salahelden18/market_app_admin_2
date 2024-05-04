import 'package:dartz/dartz.dart';
import '../models/banner_request_model.dart';
import '../../../../core/error/http_failure.dart';
import '../models/banner_model.dart';

abstract class BannerRepo {
  Future<Either<HttpFailure, List<BannerModel>?>> getBanners(String query);
  Future<Either<HttpFailure, BannerModel?>> addBanner(
      BannerRequestModel bannerRequestModel);
  Future<Either<HttpFailure, dynamic>> toogleBanner(int id);
}
