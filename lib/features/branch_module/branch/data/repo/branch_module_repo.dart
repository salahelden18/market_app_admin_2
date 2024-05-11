import 'package:dartz/dartz.dart';
import 'package:market_app_web_2/features/branch_module/branch/data/models/order_status_model.dart';
import '../models/update_order_model.dart';
import '../models/update_order_request_model.dart';

import '../../../../../core/error/http_failure.dart';
import '../models/order_model.dart';

abstract class BranchModuleRepo {
  Future<Either<HttpFailure, OrderModel?>> getOrderDetails(String orderId);
  Future<Either<HttpFailure, UpdateOrderModel?>> updateOrderStatus(
      UpdateOrderRequestModel updateOrderRequestModel);
  Future<Either<HttpFailure, List<OrderStatusModel>?>> getOrderStatus();
}
