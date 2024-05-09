import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'package:market_app_web_2/features/branch_module/branch/presentation/model_views/orders_cubit.dart';
import '../../../../../../core/models/pagination_model.dart';

import '../../../data/models/order_model.dart';
import 'order_list_section.dart';
import 'total_order_count_result_widget.dart';

class OrderMainSection extends StatefulWidget {
  const OrderMainSection(
      {super.key, required this.orders, required this.pagination});
  final PaginationModel? pagination;
  final List<OrderModel> orders;

  @override
  State<OrderMainSection> createState() => _OrderMainSectionState();
}

class _OrderMainSectionState extends State<OrderMainSection> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        final branchId = context.read<SelectedBranchCubit>().state!.id;
        context.read<OrdersCubit>().getOrders(branchId);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        TotalOrderCountResultWidget(
            totalCount: widget.pagination?.totalCount ?? 0),
        OrderListSection(
          orders: widget.orders,
          hasMore: widget.pagination?.hasNextPage ?? false,
        ),
      ],
    );
  }
}
