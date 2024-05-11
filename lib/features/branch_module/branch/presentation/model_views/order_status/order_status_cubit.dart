import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/branch_module_repo.dart';
import 'order_status_states.dart';

class OrderStatusCubit extends Cubit<OrderStatusStates> {
  OrderStatusCubit(this._branchModuleRepo) : super(OrderStatusInitialState());

  final BranchModuleRepo _branchModuleRepo;

  Future getStatuses() async {
    emit(OrderStatusLoadingState());

    final result = await _branchModuleRepo.getOrderStatus();

    result.fold(
      (l) => emit(OrderStatusFailureState(l.message)),
      (r) => emit(OrderStatusSuccessState(r!)),
    );
  }
}
