import 'package:get_it/get_it.dart';
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

  sl.registerLazySingleton<AuthenticatioRepo>(
      () => AuthenticationRepoImpl(sl()));
  sl.registerLazySingleton<AddressRepo>(() => AddressRepoImpl(sl()));
}
