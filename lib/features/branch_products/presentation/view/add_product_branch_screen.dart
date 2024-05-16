import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/add_branch_product_model.dart';
import '../model_view/unadded_products_cubit/unadded_products_cubit.dart';
import '../../../../core/utils/show_toast.dart';
import '../model_view/add_branch_product_cubit/add_branch_product_cubit.dart';
import '../model_view/add_branch_product_cubit/add_branch_product_states.dart';
import '../../../../service_locator.dart';
import '../../../../core/utils/dialog_manager_overlay.dart';
import '../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import '../../../../core/widgets/add_button_navigation_bar.dart';
import '../../../../core/widgets/text_form_field_widget.dart';
import '../../../addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';

class AddProductBranchScreen extends StatefulWidget {
  static const routeName = '/add-products-screen';
  const AddProductBranchScreen({super.key});

  @override
  State<AddProductBranchScreen> createState() => _AddProductBranchScreenState();
}

class _AddProductBranchScreenState extends State<AddProductBranchScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  int? discountTypes;
  int? branchCategoryId;
  int? branchSubCategoryId;
  bool isExecuted = false;
  late String productId;
  late UnAddedProductsCubit unAddedProductsCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {
      List<dynamic> data =
          ModalRoute.of(context)!.settings.arguments as List<dynamic>;

      productId = data[0];
      unAddedProductsCubit = data[1];
      isExecuted = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    stockController.dispose();
    priceController.dispose();
    discountValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AddBranchProductCubit(sl())),
        BlocProvider.value(value: unAddedProductsCubit),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Branch Product')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsetsDirectional.all(10),
            children: [
              TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: stockController,
                label: 'Stock',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value for stock';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: priceController,
                label: 'Price',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value for Price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormFieldWidget<int>(
                selectedValue: discountTypes,
                hint: 'Discount Type',
                items: const [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Persentage %'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Discount -'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    discountTypes = value;
                  });
                },
              ),
              if (discountTypes != null) const SizedBox(height: 10),
              if (discountTypes != null)
                TextFormFieldWidget(
                  textInputType: TextInputType.number,
                  controller: discountValueController,
                  label: 'Discount Value',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter value for discount value';
                    }

                    return null;
                  },
                ),
            ],
          ),
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            return BlocListener<AddBranchProductCubit, AddBranchProductStates>(
              listener: (context, state) {
                if (state is AddBranchProductLoadingState) {
                  DialogManagerOverlay.showDialogWithMessage(context);
                } else if (state is AddBranchProductSuccessState) {
                  DialogManagerOverlay.closeDialog();
                  context
                      .read<UnAddedProductsCubit>()
                      .hideProduct(state.branchProductModel.product!.id);
                  Navigator.pop(context);
                } else if (state is AddBranchProductFailureState) {
                  DialogManagerOverlay.closeDialog();
                  showToast(context: context, msg: state.errorMessage);
                } else {
                  DialogManagerOverlay.closeDialog();
                }
              },
              child: AddButtonNavigationBarWidget(
                ontap: () async {
                  final isValid = _formKey.currentState!.validate();

                  if (!isValid) return;

                  await context.read<AddBranchProductCubit>().addBranchProduct(
                        AddBranchProductModel(
                          productId: productId,
                          branchId:
                              context.read<SelectedBranchCubit>().state!.id,
                          stock: int.tryParse(stockController.text) ?? 0,
                          price: double.tryParse(priceController.text) ?? 0,
                          discountTypes: discountTypes,
                          discountValue:
                              double.tryParse(discountValueController.text),
                        ),
                      );
                },
                title: 'Add',
              ),
            );
          },
        ),
      ),
    );
  }
}
