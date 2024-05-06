import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/app_colors.dart';
import '../../model_views/selected_branch/selected_branch_cubit.dart';
import '../add_edit_branch_screen.dart';
import '../../../../branch_module/branch/presentation/views/branch_module_screen.dart';
import '../../../data/models/branch_model.dart';

class BranchItemWidget extends StatelessWidget {
  const BranchItemWidget({super.key, required this.branchModel});
  final BranchModel branchModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SelectedBranchCubit>().selectBranch(branchModel);
        Navigator.of(context).pushNamed(BranchModuleScreen.routeName);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.primaryColor),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10),
          leading: const Icon(Icons.home_outlined),
          title: Text(branchModel.enName),
          subtitle: Text(
            branchModel.enDetailedAddress ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddEditBranchScreen.routeName,
                    arguments: branchModel);
              },
              icon: Icon(
                Icons.edit,
                color: AppColors.secondColor,
              )),
        ),
      ),
    );
  }
}
