import 'package:flutter_bloc/flutter_bloc.dart';
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
}
