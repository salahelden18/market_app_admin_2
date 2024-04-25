import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import '../cubit/sidemenu/side_menu_cubit.dart';
import 'side_menu_item_widget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SideMenuCubit>().state;
    return Container(
      height: double.infinity,
      color: AppColors.lightPrimaryColor,
      child: ListView.builder(
        itemBuilder: (ctx, index) => SideMenuItemWidget(
          isSelected: state.sideMenuList[index].id == state.selectedItem!.id,
          sideMenuModel: state.sideMenuList[index],
        ),
        itemCount: state.sideMenuList.length,
      ),
    );
  }
}
