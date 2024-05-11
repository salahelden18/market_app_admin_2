import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/order_details/update_order_status_section.dart';
import 'widgets/order_details/order_movements_widget.dart';
import 'widgets/order_details/order_products_section.dart';
import 'widgets/order_details/payment_summary_section.dart';
import 'widgets/order_details/order_details_address_section.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../model_views/order_details_cubit.dart/order_details_cubit.dart';
import '../model_views/order_details_cubit.dart/order_details_states.dart';
import 'widgets/order_details/order_details_section.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});
  static const String routeName = "/order-details-screen";

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isExecuted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {
      final orderId = ModalRoute.of(context)?.settings.arguments as String;
      print(orderId);
      context.read<OrderDetailsCubit>().getOrderDetails(orderId);
      isExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsStates>(
        builder: (context, state) {
          if (state is OrderDetailsSuccessState) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: [
                // update order status section
                UpdateOrderStatusSection(
                    orderId: state.order.id,
                    orderStatusId: state.order.orderStatusModel!.id),
                const SizedBox(height: 20),

                // order information section
                OrderDetailsSection(order: state.order),
                const SizedBox(height: 20),
                // order address section
                OrderDetailsAddressSection(
                    fullAddress: state.order.addressModel?.fullAddress ?? ''),
                const SizedBox(height: 20),
                // order products sections
                OrderProductsSection(
                    branchProducts: state.order.basketModel!.basketProducts),
                const SizedBox(height: 20),
                // price detials section
                PaymentSummarySection(order: state.order),
                const SizedBox(height: 20),
                // order movement section
                OrderMovementsSection(orderEvents: state.order.orderEvents)
              ],
            );
          } else if (state is OrderDetailsLoadingState) {
            return const LoadingWidget();
          } else {
            final errorMessage = state is OrderDetailsFailureState
                ? state.errorMessage
                : 'Error';
            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }
}
