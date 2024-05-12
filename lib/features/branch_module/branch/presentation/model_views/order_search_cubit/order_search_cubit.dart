import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/branch_module_repo.dart';
import 'order_search_states.dart';

class OrderSearchCubit extends Cubit<OrderSearchStates> {
  OrderSearchCubit(this._branchModuleRepo) : super(OrderSearchInitialState());

  final BranchModuleRepo _branchModuleRepo;

  Future search(int orderId) async {
    emit(OrderSearchLoadingState());

    var result = await _branchModuleRepo.getSearchOrder(orderId);

    result.fold(
      (l) => emit(OrderSearchFailureState(l.message)),
      (r) => emit(OrderSearchSuccessState(r!)),
    );
  }
}
