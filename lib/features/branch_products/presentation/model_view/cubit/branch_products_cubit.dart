import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/models/pagination_model.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_model.dart';
import 'package:market_app_web_2/features/branch_products/data/repos/branch_product_repo_impl.dart';
import 'package:market_app_web_2/features/products/data/models/product_filter_model.dart';
import 'package:market_app_web_2/service_locator.dart';

part 'branch_products_state.dart';

class BranchProductsCubit extends Cubit<BranchProductsStates> {
  BranchProductsCubit() : super(BranchProductsStates());

  final BranchProductRepoImpl _branchProductRepoImpl =
      BranchProductRepoImpl(sl());
  ProductFilterModel productFilterModel = const ProductFilterModel();
  bool hasMore = true;
  List<BranchProductModel> branchProducts = [];

  Future getBranchProducts({
    required BuildContext context,
    required bool isFirst,
    String? categoryId,
    String? subCategoryId,
    bool isFilter = false,
  }) async {
    if (!hasMore) {
      print('<<<<<<<<< No More Branch Products >>>>>>>>>');
      return;
    }
    if (isFirst) {
      emit(GetBranchProductsLoadingState());
    }
    // Filter products
    if (isFilter) {
      branchProducts.clear();
    }

    productFilterModel.copyWith(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );

    // Fetching data
    var result = await _branchProductRepoImpl.getBranchProducts(
        context.read<SelectedBranchCubit>().state!.id,
        productFilterModel.toQueryString());

    result.fold((l) => GetBranchProductsErrorState(l.message), (r) {
      productFilterModel.copyWith(
        page: productFilterModel.page + 1,
      );
      hasMore = r!.paginationModel.hasNextPage;
      branchProducts.addAll(r.branchProducts);
      emit(GetBranchProductsSuccessState(branchProducts,r.paginationModel));
    });
  }

  resetState() {
    emit(BranchProductsStates());
  }
}
