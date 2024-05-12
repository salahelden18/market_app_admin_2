import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../service_locator.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../model_views/order_search_cubit/order_search_cubit.dart';
import '../model_views/order_search_cubit/order_search_states.dart';
import 'widgets/order_item_widget.dart';

class OrderSearchScreen extends StatefulWidget {
  const OrderSearchScreen({super.key});
  static const String routeName = '/order-search-screen';

  @override
  State<OrderSearchScreen> createState() => _OrderSearchScreenState();
}

class _OrderSearchScreenState extends State<OrderSearchScreen> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => OrderSearchCubit(sl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            search = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AppColors.lightGray),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: search.isEmpty
                          ? null
                          : () {
                              context
                                  .read<OrderSearchCubit>()
                                  .search(int.tryParse(search) ?? 10);
                            },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              BlocBuilder<OrderSearchCubit, OrderSearchStates>(
                builder: (context, state) {
                  if (state is OrderSearchLoadingState) {
                    return const LoadingWidget();
                  } else if (state is OrderSearchSuccessState) {
                    if (state.orders.isEmpty) {
                      return const Center(
                        child: Text('No Orders With the provided Id'),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: state.orders.length,
                        itemBuilder: (ctx, index) =>
                            OrderItemWidget(order: state.orders[index]),
                      ),
                    );
                  } else {
                    final errorMessage = state is OrderSearchFailureState
                        ? state.errorMessage
                        : 'Search for an order';
                    return Center(
                      child: Text(errorMessage),
                    );
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
