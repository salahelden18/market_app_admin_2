import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import '../../../../../../core/utils/get_order_status_color.dart';
import '../order_details_screen.dart';
import '../../../../../../core/style/app_colors.dart';
import '../../../../../../core/utils/format_date.dart';
import '../../../data/models/order_model.dart';
import 'order_name_value_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final branch = context.read<SelectedBranchCubit>();
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.of(context)
            .pushNamed(OrderDetailsScreen.routeName, arguments: order.id);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            bottomEnd: Radius.circular(20),
          ),
          border: Border.all(color: AppColors.lightGray, width: 3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.lightGray,
              size: 60,
            )),
            OrderNameValueWidget(
                text: 'Order Id', value: order.orderId.toString()),
            if (order.basketModel != null) const SizedBox(height: 10),
            if (order.basketModel != null)
              OrderNameValueWidget(
                text: 'Total Price',
                value:
                    '${order.totalPrice + order.deliveryFees} ${branch.state?.currencySymbol ?? '₺'}',
              ),
            const SizedBox(height: 10),
            OrderNameValueWidget(
              text: 'Order Statues',
              value: order.orderStatusModel!.enName!,
              textColor: getOrderStatusColor(order.orderStatusModel!.enName!),
            ),
            const SizedBox(height: 10),
            OrderNameValueWidget(
                text: 'Payment Method',
                value: order.paymentMethodModel!.enName),
            const SizedBox(height: 10),
            OrderNameValueWidget(
                text: 'Created At', value: formatDateTime(order.createdAt)),
          ],
        ),
      ),
    );
  }
}
