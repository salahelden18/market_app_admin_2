import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/addresses/presentation/model_view/districts_cubit/district_cubit.dart';
import 'package:market_app_web_2/features/addresses/presentation/model_view/sub_districts_cubit/subdistrict_cubit.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/branch_cubit/branch_cubit.dart';
import 'package:market_app_web_2/features/home/presentation/model_views/stats/stats_cubit.dart';
import 'package:market_app_web_2/features/products/presentation/model_views/products_cubit.dart';
import 'features/addresses/presentation/model_view/city_cubit/city_cubit.dart';
import 'features/addresses/presentation/model_view/countries_cubit/countries_cubit.dart';
import 'features/categories/presentation/model_views/subcategory/subcategory_cubit.dart';
import 'core/cubit/sidemenu/side_menu_cubit.dart';
import 'core/style/theme.dart';
import 'core/utils/router.dart';
import 'features/authentication/presentation/model_views/auto_authentication_cubit/auto_authentication_cubit.dart';
import 'features/categories/presentation/model_views/categories_cubit.dart';
import 'splash_screen.dart';
import 'custom_bloc_observer.dart';
import 'features/authentication/presentation/model_views/sign_in/signin_cubit.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  Bloc.observer = CustomBlocObserver();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (ctx) =>
                AutoAuthenticationCubit(di.sl())..authenticateUser()),
        BlocProvider(
          create: (ctx) => SiginCubit(di.sl(), di.sl()),
        ),
        BlocProvider(create: (ctx) => SideMenuCubit()..init()),
        BlocProvider(create: (ctx) => CategoriesCubit(di.sl())),
        BlocProvider(create: (ctx) => SubCategoryCubit(di.sl())),
        BlocProvider(create: (ctx) => CountriesCubit(di.sl())),
        BlocProvider(create: (ctx) => CityCubit(di.sl())),
        BlocProvider(create: (ctx) => DistrictCubit(di.sl())),
        BlocProvider(create: (ctx) => SubDistrictCubit(di.sl())),
        BlocProvider(create: (ctx) => StatsCubit(di.sl())),
        BlocProvider(create: (ctx) => BranchCubit(di.sl())),
        BlocProvider(create: (ctx) => ProductsCubit(di.sl())),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: generateRouter,
        home: const SplashScreen(),
      ),
    );
  }
}
