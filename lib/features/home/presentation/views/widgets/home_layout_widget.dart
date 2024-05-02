import 'package:flutter/material.dart';
import 'package:market_app_web_2/features/home/presentation/views/widgets/add_new_branch_section.dart';
import 'package:market_app_web_2/features/home/presentation/views/widgets/branches_section.dart';
import 'stats_grid_widget.dart';

class HomeLayoutWidget extends StatelessWidget {
  const HomeLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        StatsGridWidget(),
        AddNewBranchSection(),
        BranchesSection(),
      ],
    );
  }
}
