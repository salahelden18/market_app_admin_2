import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/branch_module_repo.dart';
import 'order_details_states.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsStates> {
  OrderDetailsCubit(this._branchModuleRepo) : super(OrderDetailsInitialState());
  final BranchModuleRepo _branchModuleRepo;

  Future getOrderDetails(String orderId, [bool showLoading = true]) async {
    if (showLoading) {
      emit(OrderDetailsLoadingState());
    }

    final result = await _branchModuleRepo.getOrderDetails(orderId);

    result.fold(
      (l) => emit(OrderDetailsFailureState(l.message)),
      (r) => emit(OrderDetailsSuccessState(r!)),
    );
  }
}
