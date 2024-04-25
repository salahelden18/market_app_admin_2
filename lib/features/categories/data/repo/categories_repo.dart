import 'package:dartz/dartz.dart';
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
}
