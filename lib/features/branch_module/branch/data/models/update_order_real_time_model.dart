import 'package:equatable/equatable.dart';
import 'order_status_model.dart';

class UpdateOrderRealTimeModel extends Equatable {
  final String id;
  final int orderId;
  final OrderStatusModel orderStatus;

  const UpdateOrderRealTimeModel(
      {required this.id, required this.orderId, required this.orderStatus});

  factory UpdateOrderRealTimeModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderRealTimeModel(
      id: json['id'],
      orderId: json['orderId'],
      orderStatus: OrderStatusModel.fromJson(json['orderStatus']),
    );
  }

  @override
  List<Object?> get props => [id, orderId, orderStatus];
}
