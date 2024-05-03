import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_edit_product_screen.dart';
import 'widgets/product_list_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../model_views/products_cubit.dart';
import '../model_views/products_states.dart';

import 'widgets/total_products_result_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  static const String routeName = '/products-screen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    if (context.read<ProductsCubit>().state is! ProductsSuccessState) {
      context.read<ProductsCubit>().getProducts();
    }

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<ProductsCubit>().getProducts(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddEditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const LoadingWidget();
          } else if (state is ProductsSuccessState) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                // display the count of the products
                TotalProductsResultWidget(
                  totalCount: state.pagination.totalCount,
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                ProductListWidget(products: state.products),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: state.pagination.hasNextPage
                      ? const Align(
                          alignment: Alignment.center,
                          child: Text('loading...'))
                      : const SizedBox(),
                ),
              ],
            );
          } else {
            final errorMessage =
                state is ProductsFailureState ? state.errorMessage : 'Error';
            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }
}
