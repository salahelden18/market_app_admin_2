import '../../features/categories/presentation/views/categories_screen.dart';

import '../models/side_menu_model.dart';

class ListConstants {
  static const List<SideMenuModel> adminSideMenuList = [
    SideMenuModel(
        id: 2,
        navigationScreen: CategoriesScreen.routeName,
        title: 'Categories'),
    SideMenuModel(
        id: 3, navigationScreen: 'navigationScreen', title: 'Address'),
    SideMenuModel(
        id: 4, navigationScreen: 'navigationScreen', title: 'Payment Methods'),
    SideMenuModel(
        id: 5, navigationScreen: 'navigationScreen', title: 'Account'),
    SideMenuModel(
        id: 6, navigationScreen: 'navigationScreen', title: 'Banners'),
  ];
}
