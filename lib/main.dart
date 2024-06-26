import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/branch_module/branch/presentation/model_views/order_details_cubit/order_details_cubit.dart';
import 'features/branch_module/branch/presentation/model_views/update_status_cubit/update_order_status_cubit.dart';
import 'core/services/navigator_observer.dart';
import 'features/branch_module/branch/presentation/model_views/order_status/order_status_cubit.dart';
import 'features/branch_module/branch_categories/presentation/model_views/branch_categories/branch_categories_cubit.dart';
import 'features/branch_module/branch_categories/presentation/model_views/branch_sub_category/branch_subcategory_cubit.dart';
import 'features/addresses/presentation/model_view/districts_cubit/district_cubit.dart';
import 'features/addresses/presentation/model_view/sub_districts_cubit/subdistrict_cubit.dart';
import 'features/branch/presentation/model_views/branch_cubit/branch_cubit.dart';
import 'features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'features/home/presentation/model_views/stats/stats_cubit.dart';
import 'features/products/presentation/model_views/products_cubit.dart';
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
        BlocProvider(create: (ctx) => SelectedBranchCubit()),
        BlocProvider(create: (ctx) => BranchCategoriesCubit(di.sl())),
        BlocProvider(create: (ctx) => BranchSubCategoryCubit(di.sl())),
        BlocProvider(create: (ctx) => OrderStatusCubit(di.sl())),
        BlocProvider(create: (ctx) => OrderDetailsCubit(di.sl())),
        BlocProvider(create: (ctx) => UpdateOrderStatusCubit(di.sl()))
      ],
      child: MaterialApp(
        navigatorObservers: [MyRouteObserver()],
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: generateRouter,
        home: const SplashScreen(),
      ),
    );
  }
}
