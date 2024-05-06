import 'package:dartz/dartz.dart';
import '../models/branch_subcategory_model.dart';
import '../models/branch_subcategory_request_model.dart';
import '../models/branch_category_request_model.dart';
import '../../../../../core/constants/endpoint_constants.dart';
import '../../../../../core/error/http_failure.dart';
import '../../../../../core/services/http_service_interface.dart';
import '../models/branch_category_model.dart';
import 'branch_categories_repo.dart';

class BranchCategoriesRepoImpl implements BranchCategoriesRepo {
  const BranchCategoriesRepoImpl(this._httpServiceInterface);

  final HttpServiceInterface _httpServiceInterface;

  @override
  Future<Either<HttpFailure, List<BranchCategoryModel>?>> getBranchCategories(
      String branchId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.branch}/$branchId/BranchCategory',
      fromJson: (decodedJson) => List<BranchCategoryModel>.from(
        decodedJson.map((e) => BranchCategoryModel.fromjson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, BranchCategoryModel?>> addBranchCategory(
      String branchId,
      BranchCategoryRequestModel branchCategoryRequestModel) async {
    return await _httpServiceInterface.post(
      url: '${EndpointConstants.branch}/$branchId/BranchCategory',
      fromJson: (decodedJson) => BranchCategoryModel.fromjson(decodedJson),
      body: branchCategoryRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, BranchSubCategoryModel?>> addBranchSubcategory(
      BranchSubcategoryRequestModel branchSubcategoryRequestModel) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.branchSubcategory,
      fromJson: (decodedJson) => BranchSubCategoryModel.fromjson(decodedJson),
      body: branchSubcategoryRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, List<BranchSubCategoryModel>?>>
      getBranchSubcategories(int branchCategoryId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.branchSubcategory}/$branchCategoryId',
      fromJson: (decodedJson) => List<BranchSubCategoryModel>.from(
        decodedJson.map((e) => BranchSubCategoryModel.fromjson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> toggleBranchCategory(
      int branchCategoryId) async {
    return await _httpServiceInterface.patch(
        url: '${EndpointConstants.branchCategory}/$branchCategoryId',
        fromJson: (decodedJson) => null);
  }

  @override
  Future<Either<HttpFailure, dynamic>> toggleBranchSubCategory(
      int branchSubCategoryId) async {
    return await _httpServiceInterface.patch(
        url: '${EndpointConstants.branchSubcategory}/$branchSubCategoryId',
        fromJson: (decodedJson) => null);
  }
}
