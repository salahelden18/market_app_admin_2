import 'package:get_it/get_it.dart';
import 'package:market_app_web_2/features/categories/data/repo/categories_repo.dart';
import 'package:market_app_web_2/features/categories/data/repo/categories_repo_impl.dart';
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

  sl.registerLazySingleton<AuthenticatioRepo>(
      () => AuthenticationRepoImpl(sl()));
  sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl(sl()));
}
