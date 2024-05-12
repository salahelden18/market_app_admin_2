import 'package:equatable/equatable.dart';

import '../../../data/models/order_model.dart';

abstract class OrderSearchStates extends Equatable {
  const OrderSearchStates();

  @override
  List<Object> get props => [];
}

class OrderSearchInitialState extends OrderSearchStates {}

class OrderSearchLoadingState extends OrderSearchStates {}

class OrderSearchSuccessState extends OrderSearchStates {
  final List<OrderModel> orders;

  const OrderSearchSuccessState(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrderSearchFailureState extends OrderSearchStates {
  final String errorMessage;

  const OrderSearchFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
