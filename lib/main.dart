import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/addresses/presentation/model_view/countries_cubit/countries_cubit.dart';
import 'package:market_app_web_2/features/categories/presentation/model_views/subcategory/subcategory_cubit.dart';
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
        BlocProvider(create: (ctx) => CountriesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: generateRouter,
        home: const SplashScreen(),
      ),
    );
  }
}
