import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/add_branch_product_model.dart';
import '../../../data/repos/branch_product_repo.dart';
import 'add_branch_product_states.dart';

class AddBranchProductCubit extends Cubit<AddBranchProductStates> {
  AddBranchProductCubit(this._branchProductsRpo)
      : super(AddBranchProductInitialState());

  final BranchProductsRpo _branchProductsRpo;

  Future addBranchProduct(AddBranchProductModel addBranchProductModel) async {
    emit(AddBranchProductLoadingState());

    var result =
        await _branchProductsRpo.addBranchProduct(addBranchProductModel);

    result.fold(
      (l) => emit(AddBranchProductFailureState(l.message)),
      (r) => emit(AddBranchProductSuccessState(r!)),
    );
  }
}
