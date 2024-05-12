import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/branch_product_repo.dart';
import '../../../data/models/branch_product_model.dart';
import '../../../../products/data/models/product_filter_model.dart';
import 'branch_products_state.dart';

class BranchProductsCubit extends Cubit<BranchProductsStates> {
  BranchProductsCubit(this._branchProductRepo)
      : super(BranchProductsInitialState());

  final BranchProductsRpo _branchProductRepo;

  ProductFilterModel productFilterModel = const ProductFilterModel();
  bool hasMore = true;
  bool isLoading = false;
  List<BranchProductModel> branchProducts = [];

  getBranchProducts(
    String branchId,
    bool isFirst,
  ) async {
    if (isLoading || !hasMore) {
      return;
    }

    if (isFirst) {
      emit(BranchProductsLoadingState());
    }

    // Fetching data
    var result = await _branchProductRepo.getBranchProducts(
        branchId, productFilterModel.toQueryString());

    result.fold(
      (l) => BranchProductsErrorState(l.message),
      (r) {
        productFilterModel =
            productFilterModel.copyWith(page: productFilterModel.page + 1);

        hasMore = r!.paginationModel.hasNextPage;

        branchProducts = List<BranchProductModel>.from(branchProducts)
          ..addAll(r.branchProducts);
        emit(BranchProductsSuccessState(branchProducts, r.paginationModel));
      },
    );
  }

  editBranchProduct({
    required String branchId,
    required int branchProductId,
    required int stock,
    required double price,
    required int discountTypes,
    required double discountValue,
  }) async {
    emit(BranchProductsLoadingState());

    // The result
    var result = await _branchProductRepo.editBranchProduct(
        branchProductId: branchProductId,
        stock: stock,
        price: price,
        discountTypes: discountTypes,
        discountValue: discountValue);
    result.fold((l) => BranchProductsErrorState(l.message), (r) {
      getBranchProducts(branchId, true);
    });
  }
}
