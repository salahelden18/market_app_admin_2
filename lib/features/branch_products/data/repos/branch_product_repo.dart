import 'package:dartz/dartz.dart';
import '../../../../core/error/http_failure.dart';
import '../models/add_branch_product_model.dart';
import '../models/all_branch_products_model.dart';
import '../models/branch_product_model.dart';
import '../models/branch_product_request_model.dart';
import '../models/unadded_product_model.dart';

abstract class BranchProductsRpo {
  Future<Either<HttpFailure, AllBranchProductsModel?>> getBranchProducts(
      String branchId, String query);
  Future<Either<HttpFailure, BranchProductModel?>> editBranchProduct(
      int branchProductId, BranchProductRequestModel branchProductRequestModel);
  Future<Either<HttpFailure, List<UnAddedProductModel>?>> getUnAddedProducts(
      String branchId);

  Future<Either<HttpFailure, BranchProductModel?>> addBranchProduct(
      AddBranchProductModel addBranchProductModel);
}
