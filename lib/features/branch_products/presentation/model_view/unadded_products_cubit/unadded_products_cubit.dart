import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/unadded_product_model.dart';
import '../../../data/repos/branch_product_repo.dart';
import 'unadded_products_states.dart';

class UnAddedProductsCubit extends Cubit<UnAddedProductsStates> {
  UnAddedProductsCubit(this._branchProductsRpo)
      : super(UnAddedProductsInitialState());
  final BranchProductsRpo _branchProductsRpo;

  Future getUnAddedProducts(String branchId) async {
    emit(UnAddedProductsLoadingState());

    var result = await _branchProductsRpo.getUnAddedProducts(branchId);

    result.fold(
      (l) => emit(UnAddedProductsFailureState(l.message)),
      (r) => emit(UnAddedProductsSuccessState(r!)),
    );
  }

  hideProduct(String id) {
    if (state is UnAddedProductsSuccessState) {
      final currentState = state as UnAddedProductsSuccessState;
      final List<UnAddedProductModel> products =
          List.from(currentState.products);

      products.removeWhere((element) => element.id == id);

      emit(UnAddedProductsSuccessState(products));
    }
  }
}
