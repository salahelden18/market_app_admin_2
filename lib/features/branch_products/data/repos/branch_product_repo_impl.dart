import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/constants/endpoint_constants.dart';
import 'package:market_app_web_2/core/error/http_failure.dart';
import 'package:market_app_web_2/core/services/http_service_interface.dart';
import 'package:market_app_web_2/features/branch_products/data/models/all_branch_products_model.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_model.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_request_model.dart';
import 'package:market_app_web_2/features/branch_products/data/repos/branch_product_repo.dart';

class BranchProductRepoImpl extends BranchProductsRpo {
  final HttpServiceInterface _httpServiceInterface;
  BranchProductRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, AllBranchProductsModel?>> getBranchProducts(
      String branchId, String? query) {
    return _httpServiceInterface.get(
      url: EndpointConstants.branchProducts(branchId),
      fromJson: (decodedJson) => AllBranchProductsModel.fromJson(decodedJson),
      query: query,
    );
  }

  @override
  Future<Either<HttpFailure, BranchProductModel?>> editBranchProduct(
      int branchProductId,
      BranchProductRequestModel branchProductRequestModel) {
    return _httpServiceInterface.patch(
      url: EndpointConstants.editbranchProducts(branchProductId),
      body: branchProductRequestModel.toJson(),
      fromJson: (decodedJson) => BranchProductModel.fromJson(decodedJson),
    );
  }
}
