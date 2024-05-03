import 'package:flutter/material.dart';

import 'text_form_field_widget.dart';

class NamesFields extends StatelessWidget {
  const NamesFields({
    super.key,
    required this.arNameController,
    required this.enNameController,
    required this.trNameController,
    this.arValidator,
    this.enValidator,
    this.trValidator,
  });

  final TextEditingController enNameController;
  final TextEditingController trNameController;
  final TextEditingController arNameController;
  final String? Function(String?)? enValidator;
  final String? Function(String?)? trValidator;
  final String? Function(String?)? arValidator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidget(
          label: 'English Name',
          controller: enNameController,
          validator: enValidator,
        ),
        const SizedBox(height: 10),
        TextFormFieldWidget(
          label: 'Turksish Name',
          controller: trNameController,
          validator: trValidator,
        ),
        const SizedBox(height: 10),
        TextFormFieldWidget(
          label: 'Arabic Name',
          controller: arNameController,
          validator: arValidator,
        ),
      ],
    );
  }
}
