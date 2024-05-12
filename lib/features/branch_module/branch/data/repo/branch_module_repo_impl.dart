import 'package:dartz/dartz.dart';
import '../models/order_status_model.dart';
import '../../../../../core/constants/endpoint_constants.dart';
import '../../../../../core/services/http_service_interface.dart';
import '../models/update_order_model.dart';
import '../models/update_order_request_model.dart';

import '../../../../../core/error/http_failure.dart';
import '../models/order_model.dart';
import 'branch_module_repo.dart';

class BranchModuleRepoImpl implements BranchModuleRepo {
  final HttpServiceInterface _httpServiceInterface;

  const BranchModuleRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, OrderModel?>> getOrderDetails(
      String orderId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.orderBase}/$orderId',
      fromJson: (decodedJson) => OrderModel.fromJson(decodedJson),
    );
  }

  @override
  Future<Either<HttpFailure, UpdateOrderModel?>> updateOrderStatus(
      UpdateOrderRequestModel updateOrderRequestModel) async {
    return await _httpServiceInterface.patch(
      url: EndpointConstants.updateOrder,
      fromJson: (decodedJson) => UpdateOrderModel.fromJson(decodedJson),
      body: updateOrderRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, List<OrderStatusModel>?>> getOrderStatus() async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.orderStatusBase,
      fromJson: (decodedJson) => List<OrderStatusModel>.from(
        decodedJson.map((e) => OrderStatusModel.fromJson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, List<OrderModel>?>> getSearchOrder(
      int orderId) async {
    return await _httpServiceInterface.get(
      url: '${EndpointConstants.orderSearch}/$orderId',
      fromJson: (decodedJson) => List<OrderModel>.from(
        decodedJson.map((e) => OrderModel.fromJson(e)),
      ),
    );
  }
}
