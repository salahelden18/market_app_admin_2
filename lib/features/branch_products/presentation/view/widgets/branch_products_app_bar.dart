import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/unadded_products_branch_product_screen.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/widgets/filter_widget.dart';

AppBar branchProductsAppBar(BuildContext context) => AppBar(
      title: const Text('Branch Products'),
      actions: [
        // filter branch product button
        // IconButton(
        //   onPressed: () {
        //     openDialogWithAnimation(context);
        //   },
        //   icon: const Icon(
        //     Icons.tune,
        //     color: AppColors.white,
        //   ),
        // ),
        // Add a new branch product button
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, UnAddedProductsScreen.routeName,
                arguments: context.read<BranchProductsCubit>());
          },
          icon: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ],
    );

openDialogWithAnimation(context) {
  showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(animation),
          child: const FilterWidget());
    },
  );
}
