import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';

class BranchProductsScreen extends StatefulWidget {
  static const String routeName = 'branch-products-screen';
  const BranchProductsScreen({super.key});

  @override
  State<BranchProductsScreen> createState() => _BranchProductsScreenState();
}

class _BranchProductsScreenState extends State<BranchProductsScreen> {
  @override
  void initState() {
    if (context.read<BranchProductsCubit>().state
        is! GetBranchProductsSuccessState) {
      context
          .read<BranchProductsCubit>()
          .getBranchProducts(context: context, isFirstTime: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final branchProductsCubit = context.watch<BranchProductsCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Branch Products')),

      body: BlocBuilder<BranchProductsCubit, BranchProductsStates>(
        builder: (context, state) {
          if (state is GetBranchProductsSuccessState) {
            return Center(
                child:
                    Text(branchProductsCubit.branchProducts.length.toString()));
          } else if (state is GetBranchProductsErrorState) {
            return Text(state.errorMessage);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // body: GridView.builder(gridDelegate:SliverGridDelegate() , itemBuilder:(context, index) => ProductItemWidget(productModel: ProductModel),),
    );
  }
}
