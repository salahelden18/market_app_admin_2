import 'package:dartz/dartz.dart';

import '../../../../core/error/http_failure.dart';
import '../models/all_products_model.dart';

abstract class ProductsRepo {
  Future<Either<HttpFailure, AllProductsModel?>> getProducts(String query);
}
