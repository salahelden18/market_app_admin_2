import 'package:equatable/equatable.dart';

class UpdateOrderModel extends Equatable {
  final bool updated;

  const UpdateOrderModel({required this.updated});

  factory UpdateOrderModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrderModel(updated: json['updated']);
  }

  @override
  List<Object?> get props => [updated];
}
