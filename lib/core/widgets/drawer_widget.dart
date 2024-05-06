import 'package:flutter/material.dart';
import '../constants/list_constants.dart';
import '../style/font_style.dart';
import 'divider_widget.dart';
import 'drawer_menu_item_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Marekt App',
                style: FontStyle.size18Normal,
              ),
            ),
            const SizedBox(height: 10),
            const DividerWidget(),
            const SizedBox(height: 10),
            ...List.generate(
              ListConstants.adminSideMenuList.length,
              (index) => DrawerMenuItemWidget(
                sideMenuModel: ListConstants.adminSideMenuList[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
