import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/font_style.dart';

class TotalProductsResultWidget extends StatelessWidget {
  const TotalProductsResultWidget({super.key, required this.totalCount});
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Result ($totalCount)',
          style: FontStyle.size22Black600,
        ),
      ),
    );
  }
}
