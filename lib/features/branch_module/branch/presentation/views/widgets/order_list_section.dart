import 'package:flutter/material.dart';
import 'order_item_widget.dart';

import '../../../data/models/order_model.dart';

class OrderListSection extends StatelessWidget {
  const OrderListSection(
      {super.key, required this.orders, required this.hasMore});
  final List<OrderModel> orders;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverList.builder(
        itemCount: orders.length + 1,
        itemBuilder: (ctx, index) {
          if (index < orders.length) {
            return OrderItemWidget(order: orders[index]);
          } else {
            return hasMore
                ? const Text(
                    'Loading...',
                    textAlign: TextAlign.center,
                  )
                : const SizedBox();
          }
        },
      ),
    );
  }
}
