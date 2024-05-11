import 'package:equatable/equatable.dart';

class UpdateOrderRequestModel extends Equatable {
  final String orderId;
  final String statusId;

  const UpdateOrderRequestModel({
    required this.orderId,
    required this.statusId,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'statusId': statusId,
    };
  }

  @override
  List<Object?> get props => [orderId, statusId];
}
