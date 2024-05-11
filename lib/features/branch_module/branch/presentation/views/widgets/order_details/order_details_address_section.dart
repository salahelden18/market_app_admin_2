import 'package:flutter/material.dart';
import 'order_details_container.dart';
import '../../../../../../../core/style/app_colors.dart';

class OrderDetailsAddressSection extends StatelessWidget {
  const OrderDetailsAddressSection({super.key, required this.fullAddress});
  final String fullAddress;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsContainer(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 8),
          Text(fullAddress),
        ],
      ),
    );
  }
}
