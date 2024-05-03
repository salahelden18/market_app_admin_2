import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../data/models/branch_model.dart';
import '../../../data/models/branch_request_model.dart';
import '../../../../../main.dart';
import '../../../data/repo/branch_repo.dart';

import 'branch_states.dart';

class BranchCubit extends Cubit<BranchStates> {
  BranchCubit(this._branchRepo) : super(BranchInitialState());

  final BranchRepo _branchRepo;
  List<BranchModel> branches = [];

  Future getBranches() async {
    emit(BranchLoadingState());

    var result = await _branchRepo.getBranches();

    result.fold(
      (l) => emit(BranchFailureState(l.message)),
      (r) {
        branches = r!;
        emit(BranchSuccessState(r));
      },
    );
  }

  Future addBranch(BranchRequestModel branchRequestModel) async {
    var result = await _branchRepo.addBranch(branchRequestModel);

    result.fold(
      (l) {
        showToast(
          context: navigatorKey.currentState!.context,
          msg: l.message,
        );
      },
      (r) {
        if (r != null) {
          branches = List<BranchModel>.from(branches)..add(r);
          emit(BranchSuccessState(branches));
        }
      },
    );
  }

  Future updateBranch(String id, BranchRequestModel branchRequestModel) async {
    var result = await _branchRepo.updateBranch(id, branchRequestModel);

    result.fold((l) {
      showToast(
        context: navigatorKey.currentState!.context,
        msg: l.message,
      );
    }, (r) {
      branches = branches.map((e) {
        return e.id == id ? r! : e;
      }).toList();

      emit(BranchSuccessState(branches));
    });
  }
}
