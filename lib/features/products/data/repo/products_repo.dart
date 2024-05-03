import 'package:dartz/dartz.dart';
import '../models/product_model.dart';
import '../models/product_request_model.dart';

import '../../../../core/error/http_failure.dart';
import '../models/all_products_model.dart';

abstract class ProductsRepo {
  Future<Either<HttpFailure, AllProductsModel?>> getProducts(String query);
  Future<Either<HttpFailure, ProductModel?>> addProduct(
      ProductRequsetModel productRequsetModel);
  Future<Either<HttpFailure, dynamic>> deleteProduct(String id);
}
