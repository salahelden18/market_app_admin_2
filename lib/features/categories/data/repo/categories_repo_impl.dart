import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_request.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_response.dart';
import '../models/category_request_model.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../models/category_response_model.dart';
import 'categories_repo.dart';

import '../../../../core/services/http_service_interface.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final HttpServiceInterface _httpServiceInterface;

  const CategoriesRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, List<CategoryResponseModel>?>>
      getCategories() async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.categoriesPath,
      fromJson: (decodedJson) => List<CategoryResponseModel>.from(
        decodedJson.map((e) => CategoryResponseModel.fromJson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, CategoryResponseModel?>> addCategory(
      CategoryRequestModel categoryRequestModel) async {
    return await _httpServiceInterface.request(
      url: EndpointConstants.categoriesPath,
      method: 'POST',
      fields: categoryRequestModel.toJson(),
      fromJson: (decodedJson) => CategoryResponseModel.fromJson(decodedJson),
    );
  }

  @override
  Future<Either<HttpFailure, CategoryResponseModel?>> updateCategory(
      String categoryId, CategoryRequestModel categoryRequestModel) async {
    return await _httpServiceInterface.request(
      url: '${EndpointConstants.categoriesPath}/$categoryId',
      method: 'PATCH',
      fields: categoryRequestModel.toJson(),
      fromJson: (decodedJson) => CategoryResponseModel.fromJson(decodedJson),
    );
  }

  @override
  Future<Either<HttpFailure, dynamic>> deleteCategory(String id) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.categoriesPath}/$id',
      fromJson: (p0) => null,
    );
  }

  @override
  Future<Either<HttpFailure, List<SubCategoryResponseModel>?>> getsubCategories(
      String categoryId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.subCategoriesInsidecategoryPath}/$categoryId',
      fromJson: (decodedJson) => List<SubCategoryResponseModel>.from(
          decodedJson.map((e) => SubCategoryResponseModel.fromJson(e))),
    );
  }

  @override
  Future<Either<HttpFailure, SubCategoryResponseModel?>> addSubcategory(
      SubCategoryRequest subCategoryRequest) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.subCategoryPath,
      fromJson: (decodedJson) => SubCategoryResponseModel.fromJson(decodedJson),
      body: subCategoryRequest.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, SubCategoryResponseModel?>> deleteSubcategory(
      String id) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.subCategoryPath}/$id',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, SubCategoryResponseModel?>> updateSubcategory(
      String id, SubCategoryRequest subCategoryRequest) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.subCategoryPath}/$id',
      fromJson: (decodedJson) => SubCategoryResponseModel.fromJson(decodedJson),
      body: subCategoryRequest.toJson(),
    );
  }
}
