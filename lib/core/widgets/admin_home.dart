import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/widgets/side_menu_widget.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key, required this.page});
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Flexible(
            flex: 1,
            child: SideMenuWidget(),
          ),
          Flexible(flex: 5, child: page),
        ],
      ),
    );
  }
}
