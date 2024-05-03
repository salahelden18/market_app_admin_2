import 'package:flutter/material.dart';
import 'product_item_widget.dart';

import '../../../data/models/product_model.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 230,
        ),
        itemBuilder: (ctx, index) => ProductItemWidget(
          productModel: products[index],
        ),
      ),
    );
  }
}
