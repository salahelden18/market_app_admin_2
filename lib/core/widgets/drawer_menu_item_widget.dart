import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/models/side_menu_model.dart';

class DrawerMenuItmeWidget extends StatelessWidget {
  const DrawerMenuItmeWidget({super.key, required this.sideMenuModel});
  final SideMenuModel sideMenuModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sideMenuModel.title),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        Navigator.pushNamed(context, sideMenuModel.navigationScreen);
      },
    );
  }
}
