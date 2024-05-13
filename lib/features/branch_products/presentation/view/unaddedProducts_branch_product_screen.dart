import 'package:flutter/material.dart';
import 'package:market_app_web_2/features/branch_products/data/models/main_product_model.dart';
import 'package:market_app_web_2/features/branch_products/presentation/view/widgets/unadded_product_item_widget.dart';

class UnAddedProductsScreen extends StatefulWidget {
  static const routeName = 'unadded-products-screen';

  const UnAddedProductsScreen({super.key});

  @override
  State<UnAddedProductsScreen> createState() => _UnAddedProductsScreenState();
}

class _UnAddedProductsScreenState extends State<UnAddedProductsScreen> {
  final model = MainProductModel(enName: 'Product', images: [
    'https://banner2.cleanpng.com/20171219/e8c/coca-cola-bottle-png-image-5a38c18bf0bc35.4573310315136690039861.jpg'
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Unadded Branch Product',
        ),
      ),
      // body: BlocConsumer<BranchProductsCubit, BranchProductsStates>(
      //   listener: (context, state) {},
      //   builder: (context, state) {
      //     if (state is UnAddedProductsErrorState) {
      //       return Center(child: Text(state.errorMessage));
      //     } else if (state is UnAddedProductsSuccessState) {
      //       // Todo:
      //       return GridView.builder(
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 15,
      //           crossAxisSpacing: 15,
      //           mainAxisExtent: 220,
      //         ),
      //         itemBuilder: (context, index) =>
      //             UnAddedProductItemWidget(model: model),
      //         itemCount: 22,
      //       );
      //     } else {
      //       return const LoadingWidget();
      //     }
      //   },
      // ),
      body: GridView.builder(
        padding: const EdgeInsetsDirectional.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, index) => UnAddedProductItemWidget(model: model),
        itemCount: 22,
      ),
    );
  }
}
