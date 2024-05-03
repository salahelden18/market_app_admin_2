import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/branch_model.dart';
import '../../../../core/utils/dialog_manager_overlay.dart';
import '../../data/models/branch_request_model.dart';
import '../model_views/branch_cubit/branch_cubit.dart';
import '../../../../core/widgets/add_button_navigation_bar.dart';
import '../../../../core/widgets/text_form_field_widget.dart';

class AddEditBranchScreen extends StatefulWidget {
  const AddEditBranchScreen({super.key});
  static const String routeName = '/add-edit-branch-screen';

  @override
  State<AddEditBranchScreen> createState() => _AddEditBranchScreenState();
}

class _AddEditBranchScreenState extends State<AddEditBranchScreen> {
  late final TextEditingController englishNameController;
  late final TextEditingController turkishNameController;
  late final TextEditingController arabicNameController;
  late final TextEditingController englishAddressController;
  late final TextEditingController turkishAddressController;
  late final TextEditingController arabicAddressController;
  late final TextEditingController currencyController;
  late final TextEditingController currencySymbolController;
  late final TextEditingController deliveryFeesController;
  late final TextEditingController deliveryTimeController;
  late final TextEditingController minimumOrderValueController;
  late final TextEditingController maximumAreaController;
  late final TextEditingController latController;
  late final TextEditingController lngController;
  final _formKey = GlobalKey<FormState>();
  bool isExecuted = false;
  late BranchModel? branchModel;

  @override
  void initState() {
    super.initState();
    englishNameController = TextEditingController();
    turkishNameController = TextEditingController();
    arabicNameController = TextEditingController();
    englishAddressController = TextEditingController();
    turkishAddressController = TextEditingController();
    arabicAddressController = TextEditingController();
    currencyController = TextEditingController();
    currencySymbolController = TextEditingController();
    deliveryFeesController = TextEditingController();
    deliveryTimeController = TextEditingController();
    minimumOrderValueController = TextEditingController();
    maximumAreaController = TextEditingController();
    latController = TextEditingController();
    lngController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isExecuted) {
      branchModel = ModalRoute.of(context)?.settings.arguments as BranchModel?;
      englishNameController.text = branchModel?.enName ?? '';
      turkishNameController.text = branchModel?.trName ?? '';
      arabicNameController.text = branchModel?.arName ?? '';
      englishAddressController.text = branchModel?.enDetailedAddress ?? '';
      turkishAddressController.text = branchModel?.trDetailedAddress ?? '';
      arabicAddressController.text = branchModel?.arDetailedAddress ?? '';
      currencyController.text = branchModel?.currency ?? '';
      currencySymbolController.text = branchModel?.currencySymbol ?? '';
      deliveryFeesController.text = branchModel?.deliveryFees?.toString() ?? '';
      deliveryTimeController.text = branchModel?.deliveryTime?.toString() ?? '';
      minimumOrderValueController.text =
          branchModel?.minimumOrderValue?.toString() ?? '';
      maximumAreaController.text =
          branchModel?.maximumCoverAreaInKM?.toString() ?? '';
      latController.text = branchModel?.lat.toString() ?? '';
      lngController.text = branchModel?.lng.toString() ?? '';
      isExecuted = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    englishNameController.dispose();
    turkishNameController.dispose();
    arabicNameController.dispose();
    englishAddressController.dispose();
    turkishAddressController.dispose();
    arabicAddressController.dispose();
    currencyController.dispose();
    currencySymbolController.dispose();
    deliveryFeesController.dispose();
    deliveryTimeController.dispose();
    minimumOrderValueController.dispose();
    maximumAreaController.dispose();
    latController.dispose();
    lngController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${branchModel == null ? 'Add' : 'Edit'} Branch'),
      ),
      bottomNavigationBar: AddButtonNavigationBarWidget(
        ontap: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            BranchRequestModel branchRequestModel = BranchRequestModel(
              enName: englishNameController.text,
              enDetailedAddress: englishAddressController.text,
              arName: arabicNameController.text,
              arDetailedAddress: arabicAddressController.text,
              trName: turkishNameController.text,
              trDetailedAddress: turkishAddressController.text,
              currency: currencyController.text.toUpperCase(),
              currencySymbol: currencySymbolController.text,
              deliveryFees: double.tryParse(deliveryFeesController.text) ?? 0.0,
              deliveryTime: double.tryParse(deliveryTimeController.text) ?? 0.0,
              lat: double.tryParse(latController.text) ?? 0.0,
              lng: double.tryParse(lngController.text) ?? 0.0,
              maximumCoverAreaInkM:
                  double.tryParse(maximumAreaController.text) ?? 0.0,
              minimumOurderValue:
                  double.tryParse(minimumOrderValueController.text) ?? 0.0,
            );

            DialogManagerOverlay.showDialogWithMessage(context);

            if (branchModel == null) {
              await context.read<BranchCubit>().addBranch(branchRequestModel);
            } else {
              await context
                  .read<BranchCubit>()
                  .updateBranch(branchModel!.id, branchRequestModel);
            }
            DialogManagerOverlay.closeDialog();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        },
        title: '${branchModel == null ? 'Add' : 'Edit'} Branch',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormFieldWidget(
              label: 'English Name',
              controller: englishNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter a value';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              label: 'Turkish Name',
              controller: turkishNameController,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              label: 'Arabic Name',
              controller: arabicNameController,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              label: 'English Address',
              controller: englishAddressController,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              label: 'Turksih Address',
              controller: turkishAddressController,
            ),
            const SizedBox(height: 10),
            TextFormFieldWidget(
              label: 'Arabic Address',
              controller: arabicAddressController,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Currency',
                    controller: currencyController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Currency Symbol',
                    controller: currencySymbolController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Delivery Fees',
                    controller: deliveryFeesController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Delivery Time',
                    controller: deliveryTimeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Minimum Order Value',
                    controller: minimumOrderValueController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Maximum Area',
                    controller: maximumAreaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Lat',
                    controller: latController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormFieldWidget(
                    label: 'Lng',
                    controller: lngController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a value';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
