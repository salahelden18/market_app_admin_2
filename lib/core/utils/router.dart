import 'package:flutter/material.dart';
import 'package:market_app_web_2/features/authentication/presentation/views/authentication_screen.dart';
import 'package:market_app_web_2/features/home/presentation/views/home_screen.dart';
import 'package:market_app_web_2/features/splash_screen.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AuthenticationScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const AuthenticationScreen(), settings: settings);
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const HomeScreen(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (ctx) => const SplashScreen(),
        settings: settings,
      );
  }
}
