import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/widgets/branch_products_app_bar.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/widgets/branch_products_grid.dart';
import '../model_view/cubit/branch_products_state.dart';

class BranchProductsScreen extends StatefulWidget {
  static const String routeName = 'branch-products-screen';
  const BranchProductsScreen({super.key});

  @override
  State<BranchProductsScreen> createState() => _BranchProductsScreenState();
}

class _BranchProductsScreenState extends State<BranchProductsScreen> {
  final scrollController = PageController();
  bool isExecuted = false;
  late String branchId;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {  
      branchId = context.read<SelectedBranchCubit>().state!.id;
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          context
              .read<BranchProductsCubit>()
              .getBranchProducts(branchId, false);
        }
      });
      context.read<BranchProductsCubit>().getBranchProducts(branchId, true);
      isExecuted = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: branchProductsAppBar(context),
      body: BlocBuilder<BranchProductsCubit, BranchProductsStates>(
        builder: (context, state) {
          // In the case of success
          if (state is BranchProductsSuccessState) {
            return ListView(
              controller: scrollController,
              padding: const EdgeInsetsDirectional.all(10),
              children: [
                // The total results
                Text(
                  'Result (${state.paginationModel.totalCount})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // The products list
                const BranchProductsGrid(),
                // The loading widget
                if (state.paginationModel.hasNextPage)
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Loading....'),
                  )),
              ],
            );
            // In the case of error
          } else if (state is BranchProductsErrorState) {
            return Text(state.errorMessage);
          } else {
            // In the case of loading
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
