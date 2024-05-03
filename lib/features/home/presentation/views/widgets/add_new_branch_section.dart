import 'package:flutter/material.dart';
import '../../../../../core/style/font_style.dart';
import '../../../../branch/presentation/views/add_edit_branch_screen.dart';

class AddNewBranchSection extends StatelessWidget {
  const AddNewBranchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Branches', style: FontStyle.size22Black600),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddEditBranchScreen.routeName);
              },
              child: const Text('Add New Branch'),
            ),
          ],
        ),
      ),
    );
  }
}
