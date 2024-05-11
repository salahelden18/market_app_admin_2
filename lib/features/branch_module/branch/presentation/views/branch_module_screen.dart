import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/orders_main_section.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../model_views/orders_state.dart';
import '../model_views/orders_cubit.dart';
import 'widgets/branch_module_drawer_widget.dart';
import '../../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';

class BranchModuleScreen extends StatefulWidget {
  const BranchModuleScreen({super.key});
  static const String routeName = '/branch-module-screen';

  @override
  State<BranchModuleScreen> createState() => _BranchModuleScreenState();
}

class _BranchModuleScreenState extends State<BranchModuleScreen> {
  bool isExecuted = false;
  late SelectedBranchCubit branch;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (!isExecuted) {
      branch = context.read<SelectedBranchCubit>();

      await context.read<OrdersCubit>().startConnection();
      // ignore: use_build_context_synchronously
      context.read<OrdersCubit>().listenForOrders();
      // ignore: use_build_context_synchronously
      context.read<OrdersCubit>().listenForNewOrder();
      // ignore: use_build_context_synchronously
      context.read<OrdersCubit>().listenForUpdateOrder();
      // ignore: use_build_context_synchronously
      await context.read<OrdersCubit>().getOrders(branch.state!.id);
      isExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(branch.state?.enName ?? 'Branch'),
      ),
      drawer: const BranchModuleDrawerWidget(),
      body: BlocBuilder<OrdersCubit, OrderStates>(
        builder: (context, state) {
          if (state.isLoading == false) {
            if (state.orders.isEmpty) {
              return const Center(
                child: Text('You don\'t have any Orders Yet'),
              );
            }
            return OrderMainSection(
              orders: state.orders,
              pagination: state.pagination,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
