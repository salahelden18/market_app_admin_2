import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/dialog_manager_overlay.dart';
import '../../../branch/presentation/model_views/selected_branch/selected_branch_cubit.dart';
import '../../data/models/branch_product_request_model.dart';
import '../model_view/cubit/branch_products_cubit.dart';
import '../../../../core/widgets/add_button_navigation_bar.dart';
import '../../../addresses/presentation/views/widgets/dropdown_button_form_field_widget.dart';
import '../../../../core/widgets/text_form_field_widget.dart';
import '../../data/models/branch_product_model.dart';

class EditBranchProductScreen extends StatefulWidget {
  static const routeName = '/edit-branch-product-screen';
  const EditBranchProductScreen({super.key});

  @override
  State<EditBranchProductScreen> createState() =>
      _EditBranchProductScreenState();
}

class _EditBranchProductScreenState extends State<EditBranchProductScreen> {
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountValueController = TextEditingController();
  int? discountTypes;

  BranchProductModel? branchProductModel;
  late String branchId;
  List<dynamic> arguments = [];
  late BranchProductsCubit branchProductsCubit;

  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    branchId = context.read<SelectedBranchCubit>().state!.id;
    arguments = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    branchProductModel = arguments[0] as BranchProductModel?;
    branchProductsCubit = arguments[1];

    if (branchProductModel != null) {
      stockController.text = branchProductModel?.stock?.toString() ?? '';
      priceController.text = branchProductModel?.price?.toString() ?? '';
      discountValueController.text =
          branchProductModel?.discountValue?.toString() ?? '';
      discountTypes = branchProductModel!.discountTypes;
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: branchProductsCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Branch Product')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsetsDirectional.all(10),
            children: [
              const SizedBox(height: 20),
              TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: stockController,
                label: 'Stock',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*$')),
                ],
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: priceController,
                label: 'Price',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButtonFormFieldWidget<int>(
                  selectedValue: discountTypes,
                  hint: 'Select Discount Type',
                  items: const [
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text('Persentage %'),
                    ),
                    DropdownMenuItem<int>(
                      value: 0,
                      child: Text('Discount -'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      discountTypes = value;
                    });
                  }),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                textInputType: TextInputType.number,
                controller: discountValueController,
                label: 'Discount Value',
              ),
            ],
          ),
        ),
        bottomNavigationBar: Builder(builder: (context) {
          return AddButtonNavigationBarWidget(
            ontap: () async {
              final isValid = _formKey.currentState!.validate();

              if (!isValid) {
                return;
              }
              DialogManagerOverlay.showDialogWithMessage(context);

              final result =
                  await context.read<BranchProductsCubit>().editBranchProduct(
                        branchProductModel!.id,
                        BranchProductRequestModel(
                          discountTypes: discountTypes,
                          discountValue:
                              double.tryParse(discountValueController.text),
                          price: double.tryParse(priceController.text) ?? 0.0,
                          stock: int.tryParse(stockController.text) ?? 0,
                        ),
                      );

              DialogManagerOverlay.closeDialog();

              if (result) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            title: 'Edit',
          );
        }),
      ),
    );
  }
}
