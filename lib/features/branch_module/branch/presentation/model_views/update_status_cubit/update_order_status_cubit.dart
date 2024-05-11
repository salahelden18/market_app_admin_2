import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/update_order_request_model.dart';
import '../../../data/repo/branch_module_repo.dart';
import 'update_order_status_states.dart';

class UpdateOrderStatusCubit extends Cubit<UpdateOrderStatusStates> {
  final BranchModuleRepo _branchModuleRepo;

  UpdateOrderStatusCubit(this._branchModuleRepo)
      : super(UpdateOrderStatusInitialState());

  Future updateOrder(UpdateOrderRequestModel updateOrderRequestModel) async {
    emit(UpdateOrderStatusLoadingState());

    final result =
        await _branchModuleRepo.updateOrderStatus(updateOrderRequestModel);

    result.fold(
      (l) => emit(UpdateOrderStatusFailureState(l.message)),
      (r) => emit(UpdateOrderStatusSuccessState(r!)),
    );
  }
}
