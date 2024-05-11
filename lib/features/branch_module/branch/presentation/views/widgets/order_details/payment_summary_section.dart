import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'order_details_container.dart';

import '../../../../data/models/order_model.dart';
import 'payment_summary_item_widget.dart';

class PaymentSummarySection extends StatelessWidget {
  const PaymentSummarySection({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final branch = context.read<SelectedBranchCubit>();
    return OrderDetailsContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentSummaryItemWidget(
            title: 'Sub Total',
            value:
                '${order.totalPrice.toString()} ${branch.state?.currencySymbol ?? '₺'}',
          ),
          const SizedBox(height: 10),
          PaymentSummaryItemWidget(
            title: 'Delivery Fees',
            value:
                '${order.deliveryFees.toString()} ${branch.state?.currencySymbol ?? '₺'}',
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          PaymentSummaryItemWidget(
            title: 'Total',
            value:
                "${order.totalPrice + order.deliveryFees} ${branch.state?.currencySymbol ?? '₺'}",
          ),
        ],
      ),
    );
  }
}
