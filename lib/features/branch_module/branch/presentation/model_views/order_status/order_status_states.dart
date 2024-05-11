import 'package:equatable/equatable.dart';

import '../../../data/models/order_status_model.dart';

abstract class OrderStatusStates extends Equatable {
  const OrderStatusStates();

  @override
  List<Object> get props => [];
}

class OrderStatusInitialState extends OrderStatusStates {}

class OrderStatusLoadingState extends OrderStatusStates {}

class OrderStatusSuccessState extends OrderStatusStates {
  final List<OrderStatusModel> orderStatus;

  const OrderStatusSuccessState(this.orderStatus);

  @override
  List<Object> get props => [orderStatus];
}

class OrderStatusFailureState extends OrderStatusStates {
  final String errorMessage;

  const OrderStatusFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
