import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/branch_model.dart';

class SelectedBranchCubit extends Cubit<BranchModel?> {
  SelectedBranchCubit() : super(null);

  void selectBranch(BranchModel branchModel) {
    emit(branchModel);
  }
}
