import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/core/constants/endpoint_constants.dart';
import 'package:market_app_web_2/features/products/data/models/product_model.dart';
import 'package:market_app_web_2/features/products/data/models/product_request_model.dart';
import '../../../../core/error/http_failure.dart';
import '../models/all_products_model.dart';

import '../../../../core/services/http_service_interface.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  const ProductsRepoImpl(this._httpServiceInterface);

  final HttpServiceInterface _httpServiceInterface;

  @override
  Future<Either<HttpFailure, AllProductsModel?>> getProducts(
      String query) async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.product,
      fromJson: (decodedJson) => AllProductsModel.fromJson(decodedJson),
      query: query,
    );
  }

  @override
  Future<Either<HttpFailure, ProductModel?>> addProduct(
      ProductRequsetModel productRequsetModel) async {
    return await _httpServiceInterface.request(
      method: 'POST',
      url: EndpointConstants.product,
      fromJson: (decodedJson) => ProductModel.fromJson(decodedJson),
      fields: productRequsetModel.toJson(),
    );
  }
}
