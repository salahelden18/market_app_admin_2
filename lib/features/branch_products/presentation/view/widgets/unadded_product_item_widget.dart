import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/font_style.dart';
import 'package:market_app_web_2/features/branch_products/data/models/main_product_model.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/add_product_branch_screen.dart';

class UnAddedProductItemWidget extends StatelessWidget {
  const UnAddedProductItemWidget({super.key, required this.model});

  final MainProductModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AddProductBranchScreen.routeName);
      },
      child: Container(
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
            if (model.images!.isNotEmpty)
              Image.network(
                model.images![0],
                height: 80,
              ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            Text(
              model.enName!,
              style: FontStyle.size22Black600,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
