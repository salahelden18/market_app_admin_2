import 'package:get_it/get_it.dart';
import 'features/branch_products/data/repos/branch_product_repo_impl.dart';
import 'features/branch_module/branch/data/services/order_service.dart';
import 'features/banners/data/repo/banner_repo.dart';
import 'features/banners/data/repo/banner_repo_impl.dart';
import 'features/branch_module/branch/data/repo/branch_module_repo.dart';
import 'features/branch_module/branch/data/repo/branch_module_repo_impl.dart';
import 'features/branch_module/branch_categories/data/repo/branch_categories_repo.dart';
import 'features/branch_module/branch_categories/data/repo/branch_categories_repo_impl.dart';
import 'features/branch_products/data/repos/branch_product_repo.dart';
import 'features/categories/data/repo/categories_repo.dart';
import 'features/categories/data/repo/categories_repo_impl.dart';
import 'features/products/data/repo/preoducts_repo_impl.dart';
import 'features/products/data/repo/products_repo.dart';
import 'features/branch/data/repo/branch_repo.dart';
import 'features/branch/data/repo/branch_repo_impl.dart';
import 'features/home/data/repo/home_repo.dart';
import 'features/home/data/repo/home_repo_impl.dart';
import 'features/addresses/data/repository/countries_repo/address_repo.dart';
import 'features/addresses/data/repository/countries_repo/address_repo_impl.dart';
import 'core/services/http_service.dart';
import 'features/authentication/data/repos/authentication_repo.dart';
import 'features/authentication/data/repos/authentication_repo_impl.dart';

import 'core/services/http_service_interface.dart';
import 'core/services/shared_preferences_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Services
  sl.registerLazySingleton(() => SharedPreferencesService());
  sl.registerLazySingleton<HttpServiceInterface>(() => HttpService(sl()));
  sl.registerLazySingleton<OrderServiceSignalR>(() => OrderServiceSignalR());

  sl.registerLazySingleton<AuthenticatioRepo>(
      () => AuthenticationRepoImpl(sl()));
  sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl(sl()));
  sl.registerLazySingleton<AddressRepo>(() => AddressRepoImpl(sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerLazySingleton<BranchRepo>(() => BranchRepoImpl(sl()));
  sl.registerLazySingleton<ProductsRepo>(() => ProductsRepoImpl(sl()));
  sl.registerLazySingleton<BannerRepo>(() => BannerRepoImpl(sl()));
  sl.registerLazySingleton<BranchModuleRepo>(() => BranchModuleRepoImpl(sl()));
  sl.registerLazySingleton<BranchCategoriesRepo>(
      () => BranchCategoriesRepoImpl(sl()));
  sl.registerLazySingleton<BranchProductsRpo>(
      () => BranchProductRepoImpl(sl()));
}
