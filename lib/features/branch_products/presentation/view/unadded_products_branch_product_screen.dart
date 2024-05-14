import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../model_view/unadded_products_cubit/unadded_products_cubit.dart';
import '../model_view/unadded_products_cubit/unadded_products_states.dart';
import 'widgets/unadded_product_item_widget.dart';

class UnAddedProductsScreen extends StatefulWidget {
  static const routeName = '/unadded-products-screen';

  const UnAddedProductsScreen({super.key});

  @override
  State<UnAddedProductsScreen> createState() => _UnAddedProductsScreenState();
}

class _UnAddedProductsScreenState extends State<UnAddedProductsScreen> {
  @override
  void initState() {
    super.initState();
    final branchId = context.read<SelectedBranchCubit>().state!.id;
    context.read<UnAddedProductsCubit>().getUnAddedProducts(branchId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
        ),
      ),
      body: BlocBuilder<UnAddedProductsCubit, UnAddedProductsStates>(
        builder: (context, state) {
          if (state is UnAddedProductsLoadingState) {
            return const LoadingWidget();
          } else if (state is UnAddedProductsSuccessState) {
            if (state.products.isEmpty) {
              return const Center(
                child: Text('You already have all the products'),
              );
            }
            return GridView.builder(
              padding: const EdgeInsetsDirectional.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) =>
                  UnAddedProductItemWidget(model: state.products[index]),
              itemCount: state.products.length,
            );
          } else {
            final errorMessage = state is UnAddedProductsFailureState
                ? state.errorMessage
                : 'Error';
            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }
}
