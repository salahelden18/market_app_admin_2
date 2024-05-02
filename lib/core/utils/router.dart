import 'package:flutter/material.dart';
import 'package:market_app_web_2/features/authentication/presentation/views/authentication_screen.dart';
import '../../features/categories/presentation/views/add_edit_category_screen.dart';
import '../../features/categories/presentation/views/categories_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../splash_screen.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AuthenticationScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const AuthenticationScreen(), settings: settings);
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const HomeScreen(), settings: settings);
    case CategoriesScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(), settings: settings);
    case AddEditCategoryScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const AddEditCategoryScreen(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (ctx) => const SplashScreen(),
        settings: settings,
      );
  }
}
