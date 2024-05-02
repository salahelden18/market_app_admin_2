import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/branch_repo.dart';

import 'branch_states.dart';

class BranchCubit extends Cubit<BranchStates> {
  BranchCubit(this._branchRepo) : super(BranchInitialState());

  final BranchRepo _branchRepo;

  Future getBranches() async {
    emit(BranchLoadingState());

    var result = await _branchRepo.getBranches();

    result.fold(
      (l) => emit(BranchFailureState(l.message)),
      (r) => emit(BranchSuccessState(r!)),
    );
  }
}
