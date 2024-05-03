import 'package:market_app_web_2/features/addresses/presentation/views/countries/country_screen.dart';
import 'package:market_app_web_2/features/branch/presentation/views/branch_screen.dart';
import 'package:market_app_web_2/features/products/presentation/views/products_screen.dart';

import '../../features/categories/presentation/views/categories_screen.dart';

import '../models/side_menu_model.dart';

class ListConstants {
  static const List<SideMenuModel> adminSideMenuList = [
    SideMenuModel(
        id: 1,
        navigationScreen: CategoriesScreen.routeName,
        title: 'Categories'),
    SideMenuModel(
        id: 2, navigationScreen: CountryScreen.routeName, title: 'Addresses'),
    SideMenuModel(
        id: 3, navigationScreen: BranchScreen.routeName, title: 'Branches'),
    SideMenuModel(
        id: 3, navigationScreen: ProductsScreen.routeName, title: 'Products'),
    SideMenuModel(
        id: 4, navigationScreen: 'navigationScreen', title: 'Account'),
    SideMenuModel(
        id: 5, navigationScreen: 'navigationScreen', title: 'Payment Methods'),
    SideMenuModel(
        id: 6, navigationScreen: 'navigationScreen', title: 'Banners'),
  ];
}
