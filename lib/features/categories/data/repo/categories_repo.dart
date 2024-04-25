import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_request.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_response.dart';
import '../models/category_request_model.dart';
import '../../../../core/error/http_failure.dart';
import '../models/category_response_model.dart';

abstract class CategoriesRepo {
  Future<Either<HttpFailure, List<CategoryResponseModel>?>> getCategories();
  Future<Either<HttpFailure, CategoryResponseModel?>> addCategory(
      CategoryRequestModel categoryRequestModel);
  Future<Either<HttpFailure, CategoryResponseModel?>> updateCategory(
      String categoryId, CategoryRequestModel categoryRequestModel);
  Future<Either<HttpFailure, dynamic>> deleteCategory(String id);

  Future<Either<HttpFailure, List<SubCategoryResponseModel>?>> getsubCategories(
      String categoryId);
  Future<Either<HttpFailure, SubCategoryResponseModel?>> addSubcategory(
      SubCategoryRequest subCategoryRequest);
  Future<Either<HttpFailure, SubCategoryResponseModel?>> updateSubcategory(
      String id, SubCategoryRequest subCategoryRequest);
  Future<Either<HttpFailure, SubCategoryResponseModel?>> deleteSubcategory(
      String id);
}
