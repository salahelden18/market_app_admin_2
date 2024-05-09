import 'package:flutter/material.dart';
import '../../../../../../core/style/font_style.dart';

class TotalOrderCountResultWidget extends StatelessWidget {
  const TotalOrderCountResultWidget({super.key, required this.totalCount});
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Results ($totalCount)',
          style: FontStyle.size22Black600,
        ),
      ),
    );
  }
}
