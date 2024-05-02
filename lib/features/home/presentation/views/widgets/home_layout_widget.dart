import 'package:flutter/material.dart';
import 'stats_grid_widget.dart';

class HomeLayoutWidget extends StatelessWidget {
  const HomeLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        StatsGridWidget(),
      ],
    );
  }
}
