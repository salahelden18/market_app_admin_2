import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/utils/show_toast.dart';
import 'package:market_app_web_2/features/products/data/models/product_request_model.dart';
import 'package:market_app_web_2/main.dart';
import '../../data/models/product_filter_model.dart';
import '../../data/models/product_model.dart';
import '../../data/repo/products_repo.dart';
import 'products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit(this._productsRepo) : super(ProductsInitialState());
  final ProductsRepo _productsRepo;

  bool isLoading = false;
  bool hasMore = true;
  ProductFilterModel productFilterModel = const ProductFilterModel();
  List<ProductModel> allProducts = []; // Updated to hold all products

  Future getProducts([bool isFirst = true]) async {
    if (isLoading || !hasMore) {
      return;
    }

    if (isFirst) {
      emit(ProductsLoadingState());
    }
    isLoading = true;

    var result =
        await _productsRepo.getProducts(productFilterModel.toQueryString());

    isLoading = false;

    result.fold(
      (l) => emit(ProductsFailureState(l.message)),
      (r) {
        if (r != null) {
          hasMore = r.paginationModel.hasNextPage;
          //  increasing the count
          productFilterModel =
              productFilterModel.copyWith(page: productFilterModel.page + 1);

          allProducts = List<ProductModel>.from(allProducts)
            ..addAll(r.products);

          emit(ProductsSuccessState(allProducts, r.paginationModel));
        }
      },
    );
  }

  Future addProduct(ProductRequsetModel productRequsetModel) async {
    var result = await _productsRepo.addProduct(productRequsetModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null && state is ProductsSuccessState) {
          var pagination = (state as ProductsSuccessState).pagination;
          pagination =
              pagination.copyWith(totalCount: pagination.totalCount + 1);

          allProducts = List<ProductModel>.from(allProducts)..add(r);

          emit(ProductsSuccessState(allProducts, pagination));
        }
      },
    );
  }

  Future deleteProduct(String id) async {
    var result = await _productsRepo.deleteProduct(id);

    result.fold((l) {
      showToast(context: navigatorKey.currentState!.context, msg: l.message);
    }, (r) {
      if (state is ProductsSuccessState) {
        var pagination = (state as ProductsSuccessState).pagination;
        pagination = pagination.copyWith(totalCount: pagination.totalCount - 1);

        allProducts = List<ProductModel>.from(allProducts)
          ..removeWhere((element) => element.id == id);

        emit(ProductsSuccessState(allProducts, pagination));
      }
    });
  }

  Future updateProduct(
      String id, ProductRequsetModel productRequsetModel) async {
    var result = await _productsRepo.updateProduct(id, productRequsetModel);

    result.fold(
      (l) {
        showToast(context: navigatorKey.currentState!.context, msg: l.message);
      },
      (r) {
        if (r != null && state is ProductsSuccessState) {
          var pagination = (state as ProductsSuccessState).pagination;

          allProducts = allProducts
              .map((element) => element.id == id ? r : element)
              .toList();

          emit(ProductsSuccessState(allProducts, pagination));
        }
      },
    );
  }
}
