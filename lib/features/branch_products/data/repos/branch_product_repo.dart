import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/error/http_failure.dart';
import 'package:market_app_web_2/features/branch_products/data/models/all_branch_products_model.dart';

abstract class BranchProductsRpo {
  Future<Either<HttpFailure, AllBranchProductsModel?>> getBranchProducts(
      String branchId, String query);
}
