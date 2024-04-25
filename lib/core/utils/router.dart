import 'package:flutter/material.dart';
import 'package:market_app_web_2/features/addresses/presentation/model_view/countries_cubit/countries_cubit.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/countries/add_new_country_screen.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/addresses_screen.dart';
import 'package:market_app_web_2/features/authentication/presentation/views/authentication_screen.dart';
import 'package:market_app_web_2/features/categories/presentation/views/add_edit_category_screen.dart';
import 'package:market_app_web_2/features/categories/presentation/views/categories_screen.dart';
import 'package:market_app_web_2/features/home/presentation/views/home_screen.dart';
import 'package:market_app_web_2/service_locator.dart';
import 'package:market_app_web_2/splash_screen.dart';

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
    case AddressesScreen.routeName:
      return MaterialPageRoute(
          builder: (ctx) => const AddressesScreen(), settings: settings);
    case AddEditCountry.routeName:
      return MaterialPageRoute(
          builder: (ctx) => AddEditCountry(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (ctx) => const SplashScreen(),
        settings: settings,
      );
  }
}
