import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/list_constants.dart';
import '../../../../../../core/style/font_style.dart';
import '../../../../../../core/widgets/drawer_menu_item_widget.dart';
import '../../../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';

class BranchModuleDrawerWidget extends StatelessWidget {
  const BranchModuleDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final branch = context.read<SelectedBranchCubit>();
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                branch.state?.enName ?? 'Branch',
                style: FontStyle.size22Black600,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            ...List.generate(
              ListConstants.branchModule.length,
              (index) => DrawerMenuItemWidget(
                sideMenuModel: ListConstants.branchModule[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}
