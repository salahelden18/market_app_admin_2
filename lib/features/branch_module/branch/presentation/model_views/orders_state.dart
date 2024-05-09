import 'package:equatable/equatable.dart';
import '../../../../../core/models/pagination_model.dart';
import '../../data/models/order_model.dart';

class OrderStates extends Equatable {
  final List<OrderModel> orders;
  final PaginationModel? pagination;
  final bool isLoading;

  const OrderStates(
      {this.orders = const [], this.pagination, this.isLoading = false});

  OrderStates copyWith({
    List<OrderModel>? orders,
    PaginationModel? pagination,
    bool? isLoading,
  }) {
    return OrderStates(
      orders: orders ?? this.orders,
      pagination: pagination ?? this.pagination,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [orders, pagination];
}
