import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/features/banners/data/models/banner_request_model.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../models/banner_model.dart';
import '../../../../core/services/http_service_interface.dart';
import 'banner_repo.dart';

class BannerRepoImpl implements BannerRepo {
  const BannerRepoImpl(this._httpServiceInterface);

  final HttpServiceInterface _httpServiceInterface;

  @override
  Future<Either<HttpFailure, List<BannerModel>?>> getBanners(
      String query) async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.banners,
      fromJson: (decodedJson) => List<BannerModel>.from(
        decodedJson.map((e) => BannerModel.fromJson(e)),
      ),
      query: query,
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> toogleBanner(int id) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.banners}/$id',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, BannerModel?>> addBanner(
      BannerRequestModel bannerRequestModel) async {
    return await _httpServiceInterface.request(
      method: 'POST',
      fields: bannerRequestModel.toJson(),
      url: EndpointConstants.banners,
      fromJson: (decodedJson) => BannerModel.fromJson(decodedJson),
    );
  }
}
