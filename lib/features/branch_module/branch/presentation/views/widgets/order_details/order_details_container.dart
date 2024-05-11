import 'package:flutter/material.dart';
import '../../../../../../../core/style/app_colors.dart';

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }
}
