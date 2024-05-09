import 'package:flutter/material.dart';
import '../../../../../../core/style/app_colors.dart';

class OrderListItemWidget extends StatelessWidget {
  const OrderListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: AppColors.lightGray),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Id: '),
        ],
      ),
    );
  }
}
