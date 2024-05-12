import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';
import 'package:market_app_web_2/core/widgets/loading_widget.dart';
import 'package:market_app_web_2/core/widgets/my_main_button.dart';
import 'package:market_app_web_2/core/widgets/text_form_field_widget.dart';
import 'package:market_app_web_2/features/branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_model.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_cubit.dart';
import 'package:market_app_web_2/features/branch_products/presentation/model_view/cubit/branch_products_state.dart';
import 'package:market_app_web_2/service_locator.dart';

class EditBranchProductScreen extends StatefulWidget {
  static const routeName = 'edit-branch-product-screen';
  const EditBranchProductScreen({super.key});

  @override
  State<EditBranchProductScreen> createState() =>
      _EditBranchProductScreenState();
}

class _EditBranchProductScreenState extends State<EditBranchProductScreen> {
  BranchProductModel? branchProductModel;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  int? discountTypes;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    branchProductModel =
        ModalRoute.of(context)!.settings.arguments as BranchProductModel;

    if (branchProductModel != null) {
      stockController.text = branchProductModel!.stock.toString() ?? '';
      priceController.text = branchProductModel!.price.toString() ?? '';
      discountValueController.text =
          branchProductModel!.discountValue.toString() ?? '';
      discountTypes = branchProductModel!.discountTypes;
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Branch Product')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsetsDirectional.all(10),
          children: [
            const SizedBox(height: 10),
            TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: stockController,
                label: 'Stock'),
            const SizedBox(height: 10),
            TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: priceController,
                label: 'Price'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: Container(
                        padding: const EdgeInsetsDirectional.all(5),
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<int>(
                            value: discountTypes,
                            hint: branchProductModel!.discountTypes == 1
                                ? const Text('Persentage %')
                                : const Text('Discount -'),
                            items: const [
                              DropdownMenuItem<int>(
                                  value: 1, child: Text('Persentage %')),
                              DropdownMenuItem<int>(
                                  value: 0, child: Text('Discount -')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                discountTypes = value;
                              });
                            }))),
                const SizedBox(width: 7),
                Expanded(
                    child: TextFormFieldWidget(
                        textInputType: TextInputType.number,
                        controller: discountValueController,
                        label: 'Discount Value')),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocProvider(
            create: (context) => BranchProductsCubit(sl()),
            child: BlocConsumer<BranchProductsCubit, BranchProductsStates>(
              listener: (context, state) {
                if (state is BranchProductsSuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (ctx, state) {
                final branchProductsCubit = ctx.watch<BranchProductsCubit>();

                return state is BranchProductsLoadingState
                    ? const LoadingWidget()
                    : MyMainButton(
                        context: ctx,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            branchProductsCubit.editBranchProduct(
                              branchId:
                                  ctx.read<SelectedBranchCubit>().state!.id,
                              branchProductId: branchProductModel!.id,
                              stock: int.parse(stockController.text),
                              price: double.parse(priceController.text),
                              discountTypes: discountTypes!,
                              discountValue:
                                  double.parse(discountValueController.text),
                            );
                          }
                        },
                        title: 'Edit',
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
