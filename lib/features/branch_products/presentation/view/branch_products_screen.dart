import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/widgets/branch_products_grid.dart';
import 'package:market_app_web_2/features/products/data/models/product_model.dart';
import 'package:market_app_web_2/features/products/presentation/views/widgets/product_item_widget.dart';
import 'package:market_app_web_2/features/products/presentation/views/widgets/total_products_result_widget.dart';

class BranchProductsScreen extends StatefulWidget {
  static const String routeName = 'branch-products-screen';
  const BranchProductsScreen({super.key});

  @override
  State<BranchProductsScreen> createState() => _BranchProductsScreenState();
}

class _BranchProductsScreenState extends State<BranchProductsScreen> {
  final scrollController = PageController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context
            .read<BranchProductsCubit>()
            .getBranchProducts(context: context, isFirst: false);
      }
    });
    context
        .read<BranchProductsCubit>()
        .getBranchProducts(context: context, isFirst: true);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Branch Products')),
      body: BlocBuilder<BranchProductsCubit, BranchProductsStates>(
        builder: (context, state) {
          // In the case of success
          if (state is GetBranchProductsSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                controller: scrollController,
                children: [
                  Text(
                    'Result (${state.branchProducts.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ProductItemWidget(
                        productModel: state.branchProducts[index].product!,
                      ),
                      itemCount: state.branchProducts.length,
                    ),
                  ),
                  if (state.paginationModel.hasNextPage)
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Loading....'),
                    )),
                ],
              ),
            );
            // In the case of error
          } else if (state is GetBranchProductsErrorState) {
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
