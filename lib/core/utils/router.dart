import 'package:flutter/material.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/city/city_screen.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/district/district_screen.dart';
import 'package:market_app_web_2/features/addresses/presentation/views/subdistrict/subdistrict_screen.dart';
import '../../features/addresses/presentation/views/countries/country_screen.dart';
import '../../features/authentication/presentation/views/authentication_screen.dart';
import '../../features/categories/presentation/views/add_edit_category_screen.dart';
import '../../features/categories/presentation/views/categories_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../splash_screen.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AuthenticationScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const AuthenticationScreen(),
        settings: settings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const HomeScreen(),
        settings: settings,
      );
    case CategoriesScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const CategoriesScreen(),
        settings: settings,
      );
    case AddEditCategoryScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const AddEditCategoryScreen(),
        settings: settings,
      );
    case CountryScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const CountryScreen(),
        settings: settings,
      );

    case CityScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const CityScreen(),
        settings: settings,
      );
    case DistrictScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const DistrictScreen(),
        settings: settings,
      );
    case SubDistrictScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const SubDistrictScreen(),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (ctx) => const SplashScreen(),
        settings: settings,
      );
  }
}
