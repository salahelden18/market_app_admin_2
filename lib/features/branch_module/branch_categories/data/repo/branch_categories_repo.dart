import 'package:dartz/dartz.dart';
import '../models/branch_subcategory_model.dart';
import '../models/branch_subcategory_request_model.dart';
import '../models/branch_category_request_model.dart';
import '../../../../../core/error/http_failure.dart';
import '../models/branch_category_model.dart';

abstract class BranchCategoriesRepo {
  Future<Either<HttpFailure, List<BranchCategoryModel>?>> getBranchCategories(
      String branchId);
  Future<Either<HttpFailure, BranchCategoryModel?>> addBranchCategory(
      String branchId, BranchCategoryRequestModel branchCategoryRequestModel);
  Future<Either<HttpFailure, List<BranchSubCategoryModel>?>>
      getBranchSubcategories(int branchCategoryId);
  Future<Either<HttpFailure, BranchSubCategoryModel?>> addBranchSubcategory(
      BranchSubcategoryRequestModel branchSubcategoryRequestModel);
  Future<Either<HttpFailure, dynamic>> toggleBranchCategory(
      int branchCategoryId);
  Future<Either<HttpFailure, dynamic>> toggleBranchSubCategory(
      int branchSubCategoryId);
}
