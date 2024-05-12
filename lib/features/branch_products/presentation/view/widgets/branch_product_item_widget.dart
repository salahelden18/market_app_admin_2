import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/core/style/font_style.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_model.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/edit_branch_product_screen.dart';

class BranchProductItemWidget extends StatelessWidget {
  const BranchProductItemWidget({super.key, required this.branchProductModel});
  final BranchProductModel branchProductModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          EditBranchProductScreen.routeName,
          arguments: branchProductModel,
        );
      },
      child: Stack(
        children: [
          // The product info
          Container(
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
                if (branchProductModel.product!.images.isNotEmpty)
                  Column(
                    children: [
                      Image.network(
                        branchProductModel.product!.images[0],
                        height: 80,
                      ),
                    ],
                  ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
                // Title
                Text(
                  branchProductModel.product!.enName,
                  style: FontStyle.size22Black600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                // Price
                Text(
                  '${branchProductModel.price} ${context.read<SelectedBranchCubit>().state!.currencySymbol!}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                // Description
                if (branchProductModel.product!.enDescription != null)
                  Text(
                    branchProductModel.product!.enDescription!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          // The product stock
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 20,
                  color:
                      branchProductModel.stock == 0 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 4),
                Text(
                  branchProductModel.stock.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: branchProductModel.stock == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
