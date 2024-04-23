import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/theme.dart';
import 'package:market_app_web_2/core/utils/router.dart';
import 'package:market_app_web_2/features/authentication/presentation/model_views/auto_authentication_cubit/auto_authentication_cubit.dart';
import 'package:market_app_web_2/features/splash_screen.dart';
import 'features/authentication/presentation/model_views/sign_in/signin_cubit.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AutoAuthenticationCubit(di.sl())),
        BlocProvider(
          create: (ctx) => SiginCubit(di.sl(), di.sl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme,
        onGenerateRoute: generateRouter,
        home: const SplashScreen(),
      ),
    );
  }
}
