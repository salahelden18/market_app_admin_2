import 'package:flutter/material.dart';
import '../../features/products/presentation/views/add_edit_product_screen.dart';
import '../../features/branch/presentation/views/add_edit_branch_screen.dart';
import '../../features/products/presentation/views/products_screen.dart';
import '../../features/addresses/presentation/views/city/city_screen.dart';
import '../../features/addresses/presentation/views/district/district_screen.dart';
import '../../features/addresses/presentation/views/subdistrict/subdistrict_screen.dart';
import '../../features/branch/presentation/views/branch_screen.dart';
import '../../not_found_screen.dart';
import '../../features/addresses/presentation/views/countries/country_screen.dart';
import '../../features/authentication/presentation/views/authentication_screen.dart';
import '../../features/categories/presentation/views/add_edit_category_screen.dart';
import '../../features/categories/presentation/views/categories_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';

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
    case BranchScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const BranchScreen(),
        settings: settings,
      );
    case AddEditBranchScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const AddEditBranchScreen(),
        settings: settings,
      );
    case ProductsScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const ProductsScreen(),
        settings: settings,
      );
    case AddEditProductScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const AddEditProductScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (ctx) => const NotFoundScreen(),
        settings: settings,
      );
  }
}
