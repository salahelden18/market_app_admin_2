import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/pagination_model.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../data/models/branch_product_request_model.dart';
import '../../../../../main.dart';
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

  Future<bool> editBranchProduct(
    int branchProductId,
    BranchProductRequestModel branchProductRequestModel,
  ) async {
    var result = await _branchProductRepo.editBranchProduct(
        branchProductId, branchProductRequestModel);

    return result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
        return false;
      },
      (r) {
        if (state is BranchProductsSuccessState) {
          branchProducts = branchProducts
              .map((e) => e.id == branchProductId ? r! : e)
              .toList();

          PaginationModel paginationModel =
              (state as BranchProductsSuccessState).paginationModel;

          emit(BranchProductsSuccessState(branchProducts, paginationModel));
          return true;
        }
        return false;
      },
    );
  }
}
