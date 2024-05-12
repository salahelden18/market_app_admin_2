import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_state.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/widgets/branch_product_item_widget.dart';

class BranchProductsGrid extends StatefulWidget {
  const BranchProductsGrid({
    super.key,
  });

  @override
  State<BranchProductsGrid> createState() => _BranchProductsGridState();
}

class _BranchProductsGridState extends State<BranchProductsGrid> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BranchProductsCubit>().state
        as BranchProductsSuccessState;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) => BranchProductItemWidget(
          branchProductModel: state.branchProducts[index],
        ),
        itemCount: state.branchProducts.length,
      ),
    );
  }
}
