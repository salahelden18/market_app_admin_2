import 'package:equatable/equatable.dart';
import '../../../../../core/models/pagination_model.dart';

import 'order_model.dart';

class OrderResponseModel extends Equatable {
  final List<OrderModel> orders;
  final PaginationModel pagination;

  const OrderResponseModel({
    required this.orders,
    required this.pagination,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
      orders: List<OrderModel>.from(
          json['orders'].map((e) => OrderModel.fromJson(e))),
      pagination: PaginationModel.fromJson(
        json['pagination'],
      ),
    );
  }

  @override
  List<Object?> get props => [orders, pagination];
}
