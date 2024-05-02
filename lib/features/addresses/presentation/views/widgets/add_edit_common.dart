import 'package:flutter/material.dart';
import '../../../../../core/utils/dialog_manager_overlay.dart';
import '../../../../../core/widgets/filled_button_widget.dart';
import 'address_fields_names_widget.dart';
import 'common_bottom_sheet_widget.dart';
import '../../../data/models/common_model.dart';

class AddEditCommon extends StatefulWidget {
  const AddEditCommon({super.key, this.model, required this.fn});
  final CommonModel? model;
  final Function(String enName, String trName, String arName) fn;

  @override
  State<AddEditCommon> createState() => _AddEditCommonState();
}

class _AddEditCommonState extends State<AddEditCommon> {
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController trNameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    enNameController.text = widget.model?.enName ?? '';
    trNameController.text = widget.model?.trName ?? '';
    arNameController.text = widget.model?.arName ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    enNameController.dispose();
    trNameController.dispose();
    arNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheetWidget(
      formKey: _formKey,
      widget: Column(
        children: [
          AddressFieldsNamesWidget(
            arNameController: arNameController,
            enNameController: enNameController,
            trNameController: trNameController,
          ),
          const SizedBox(height: 15),
          FilledButtonWidget(
            onPress: () async {
              final isValid = _formKey.currentState!.validate();

              if (isValid) {
                DialogManagerOverlay.showDialogWithMessage(context);

                await widget.fn(enNameController.text, trNameController.text,
                    arNameController.text);

                DialogManagerOverlay.closeDialog();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            widget: Text('${widget.model == null ? 'Add' : 'Edit'} City'),
          ),
        ],
      ),
    );
  }
}
