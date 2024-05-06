import 'package:dartz/dartz.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../models/product_model.dart';
import '../models/product_request_model.dart';
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

  @override
  Future<Either<HttpFailure, dynamic>> deleteProduct(String id) async {
    return await _httpServiceInterface.delete(
      url: '${EndpointConstants.product}/$id',
      fromJson: (decodedJson) => null,
    );
  }

  @override
  Future<Either<HttpFailure, ProductModel?>> updateProduct(
      String id, ProductRequsetModel productRequsetModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.product}/$id',
      fromJson: (decodedJson) => ProductModel.fromJson(decodedJson),
      body: productRequsetModel.toJson(),
    );
  }
}
