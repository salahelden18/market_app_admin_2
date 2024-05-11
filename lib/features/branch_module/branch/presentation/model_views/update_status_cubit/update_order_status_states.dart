import 'package:equatable/equatable.dart';
import '../../../data/models/update_order_model.dart';

abstract class UpdateOrderStatusStates extends Equatable {
  const UpdateOrderStatusStates();

  @override
  List<Object> get props => [];
}

class UpdateOrderStatusInitialState extends UpdateOrderStatusStates {}

class UpdateOrderStatusLoadingState extends UpdateOrderStatusStates {}

class UpdateOrderStatusSuccessState extends UpdateOrderStatusStates {
  final UpdateOrderModel updateOrderModel;

  const UpdateOrderStatusSuccessState(this.updateOrderModel);

  @override
  List<Object> get props => [updateOrderModel];
}

class UpdateOrderStatusFailureState extends UpdateOrderStatusStates {
  final String errorMessage;

  const UpdateOrderStatusFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
