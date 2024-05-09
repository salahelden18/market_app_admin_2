import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch_module/branch/presentation/model_views/orders_cubit.dart';
import 'package:market_app_web_2/features/branch_module/branch_categories/presentation/views/branch_categories_screen.dart';
import 'package:market_app_web_2/features/branch_module/branch_categories/presentation/views/branch_sub_categories_screen.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/branch_products_screen.dart';
import '../../features/banners/presentation/model_views/banners_cubit.dart';
import '../../features/banners/presentation/views/banners_screen.dart';
import '../../features/branch_module/branch/presentation/views/branch_module_screen.dart';
import '../../service_locator.dart';
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
    case BannersScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => BlocProvider(
            create: (ctx) => BannersCubit(sl()), child: const BannersScreen()),
        settings: settings,
      );
    case BranchModuleScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => BlocProvider(
            create: (ctx) => OrdersCubit(sl()),
            child: const BranchModuleScreen()),
        settings: settings,
      );
    case BranchCategoryScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const BranchCategoryScreen(),
        settings: settings,
      );
    case BranchSubCategoriesScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const BranchSubCategoriesScreen(),
        settings: settings,
      );
    case BranchProductsScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => BlocProvider(
          create: (context) => BranchProductsCubit(),
          child: const BranchProductsScreen(),
        ),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (ctx) => const NotFoundScreen(),
        settings: settings,
      );
  }
}
