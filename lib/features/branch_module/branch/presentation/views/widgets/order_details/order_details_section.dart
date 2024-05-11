import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/utils/format_date.dart';
import '../../../../../../../core/utils/get_order_status_color.dart';
import '../../../../data/models/order_model.dart';
import 'order_details_container.dart';
import '../order_name_value_widget.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderNameValueWidget(
              text: 'Order Id:', value: order.orderId.toString()),
          const SizedBox(height: 10),
          OrderNameValueWidget(
            text: 'Order Statues',
            value: order.orderStatusModel!.enName!,
            textColor: getOrderStatusColor(
              order.orderStatusModel!.enName!,
            ),
          ),
          const SizedBox(height: 10),
          OrderNameValueWidget(
              text: 'Payment Method',
              value: order.paymentMethodModel?.enName ?? 'Cash'),
          const SizedBox(height: 10),
          OrderNameValueWidget(
              text: 'Created At', value: formatDateTime(order.createdAt)),
        ],
      ),
    );
  }
}
