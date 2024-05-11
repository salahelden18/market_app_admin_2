import 'package:flutter/material.dart';
import '../../../../data/models/basket_product_model.dart';
import 'order_details_container.dart';

import 'order_product_item_widget.dart';

class OrderProductsSection extends StatelessWidget {
  const OrderProductsSection({super.key, required this.branchProducts});
  final List<BasketProductModel> branchProducts;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsContainer(
      widget: Column(
        children: List.generate(
          branchProducts.length,
          (index) => Column(
            children: [
              OrderProductItemWidget(
                basketProductModel: branchProducts[index],
              ),
              if (index != branchProducts.length - 1)
                const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
