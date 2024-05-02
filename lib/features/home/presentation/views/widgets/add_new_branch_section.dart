import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/font_style.dart';

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
                // TODO navigate to add new branch screen
              },
              child: const Text('Add New Branch'),
            ),
          ],
        ),
      ),
    );
  }
}
