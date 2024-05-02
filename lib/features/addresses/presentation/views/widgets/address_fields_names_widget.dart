import 'package:flutter/material.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';

class AddressFieldsNamesWidget extends StatelessWidget {
  const AddressFieldsNamesWidget(
      {super.key,
      required this.arNameController,
      required this.enNameController,
      required this.trNameController});
  final TextEditingController enNameController;
  final TextEditingController trNameController;
  final TextEditingController arNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldWidget(
          label: 'English Name',
          controller: enNameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'should not be empty';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormFieldWidget(
            label: 'Turkish Name',
            controller: trNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'should not be empty';
              }
              return null;
            }),
        const SizedBox(height: 10),
        TextFormFieldWidget(
            label: 'Arabic Name',
            controller: arNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'should not be empty';
              }
              return null;
            }),
      ],
    );
  }
}
