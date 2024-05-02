import 'package:equatable/equatable.dart';

import '../../../data/models/branch_model.dart';

abstract class BranchStates extends Equatable {
  const BranchStates();

  @override
  List<Object> get props => [];
}

class BranchInitialState extends BranchStates {}

class BranchLoadingState extends BranchStates {}

class BranchSuccessState extends BranchStates {
  final List<BranchModel> branches;

  const BranchSuccessState(this.branches);

  @override
  List<Object> get props => [branches];
}

class BranchFailureState extends BranchStates {
  final String errorMessage;

  const BranchFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
