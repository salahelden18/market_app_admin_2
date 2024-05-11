import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/widgets/loading_widget.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/products/presentation/views/widgets/product_item_widget.dart';
import 'package:market_app_web_2/features/products/presentation/views/widgets/total_products_result_widget.dart';

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
    final branchProductsCubit = context.watch<BranchProductsCubit>();

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   mainAxisSpacing: 15,
        //   crossAxisSpacing: 15,
        //   mainAxisExtent: 220,
        // ),
        itemBuilder: (context, index) => ProductItemWidget(
          productModel: branchProductsCubit.branchProducts[index].product!,
        ),
        itemCount: branchProductsCubit.branchProducts.length,
      ),
    );
  }
}
