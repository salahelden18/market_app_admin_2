import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/cubit/sidemenu/side_menu_cubit.dart';
import 'package:market_app_web_2/core/models/side_menu_model.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/features/home/presentation/views/home_screen.dart';

class SideMenuItemWidget extends StatelessWidget {
  const SideMenuItemWidget(
      {super.key, required this.isSelected, required this.sideMenuModel});
  final bool isSelected;
  final SideMenuModel sideMenuModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final selectedItem = context.read<SideMenuCubit>();
        if (sideMenuModel.id == selectedItem.state.selectedItem!.id) {
          return;
        }

        context.read<SideMenuCubit>().selectItem(sideMenuModel.id);

        if (sideMenuModel.id == 1) {
          Navigator.of(context)
              .popUntil((route) => route.settings.name == HomeScreen.routeName);
        } else {
          Navigator.of(context).pushNamed(
            sideMenuModel.navigationScreen,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: isSelected ? AppColors.lightPrimaryColor : null,
        child: Text(sideMenuModel.title),
      ),
    );
  }
}
