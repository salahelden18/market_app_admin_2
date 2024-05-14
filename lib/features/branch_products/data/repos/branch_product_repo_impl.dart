import 'package:dartz/dartz.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../../../../core/services/http_service_interface.dart';
import '../models/add_branch_product_model.dart';
import '../models/all_branch_products_model.dart';
import '../models/branch_product_model.dart';
import '../models/branch_product_request_model.dart';
import '../models/unadded_product_model.dart';
import 'branch_product_repo.dart';

class BranchProductRepoImpl extends BranchProductsRpo {
  final HttpServiceInterface _httpServiceInterface;
  BranchProductRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, AllBranchProductsModel?>> getBranchProducts(
      String branchId, String? query) async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.branchProducts(branchId),
      fromJson: (decodedJson) => AllBranchProductsModel.fromJson(decodedJson),
      query: query,
    );
  }

  @override
  Future<Either<HttpFailure, BranchProductModel?>> editBranchProduct(
      int branchProductId,
      BranchProductRequestModel branchProductRequestModel) async {
    return await _httpServiceInterface.patch(
      url: EndpointConstants.editbranchProducts(branchProductId),
      body: branchProductRequestModel.toJson(),
      fromJson: (decodedJson) => BranchProductModel.fromJson(decodedJson),
    );
  }

  @override
  Future<Either<HttpFailure, List<UnAddedProductModel>?>> getUnAddedProducts(
      String branchId) async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.getUnAddedProducts(branchId),
      fromJson: (d) => List<UnAddedProductModel>.from(
          d.map((e) => UnAddedProductModel.fromJson(e))),
    );
  }

  @override
  Future<Either<HttpFailure, BranchProductModel?>> addBranchProduct(
      AddBranchProductModel addBranchProductModel) async {
    print(addBranchProductModel.toJson());
    return await _httpServiceInterface.post(
      url: EndpointConstants.branchProduct,
      fromJson: (decodedJson) => BranchProductModel.fromJson(decodedJson),
      body: addBranchProductModel.toJson(),
    );
  }
}
