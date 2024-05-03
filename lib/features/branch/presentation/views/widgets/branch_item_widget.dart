import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/features/branch/presentation/views/add_edit_branch_screen.dart';
import '../../../data/models/branch_model.dart';

class BranchItemWidget extends StatelessWidget {
  const BranchItemWidget({super.key, required this.branchModel});
  final BranchModel branchModel;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
