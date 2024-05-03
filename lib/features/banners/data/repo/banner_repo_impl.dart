import 'package:dartz/dartz.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../models/banner_model.dart';
import '../../../../core/services/http_service_interface.dart';
import 'banner_repo.dart';

class BannerRepoImpl implements BannerRepo {
  const BannerRepoImpl(this._httpServiceInterface);

  final HttpServiceInterface _httpServiceInterface;

  @override
  Future<Either<HttpFailure, List<BannerModel>?>> getBanners() async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.banners,
      fromJson: (decodedJson) => List<BannerModel>.from(
        decodedJson.map((e) => BannerModel.fromJson(e)),
      ),
    );
  }
}
