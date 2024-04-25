import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.lightGray,
      height: height,
    );
  }
}
