import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/font_style.dart';
import '../../../data/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 2,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (productModel.images.isNotEmpty)
            Image.network(
              productModel.images[0],
              height: 80,
            ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          Text(
            productModel.enName,
            style: FontStyle.size22Black600,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          if (productModel.enDescription != null)
            Text(
              productModel.enDescription!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
