import 'package:flutter/material.dart';

import 'text_form_field_widget.dart';

class DescriptionFields extends StatelessWidget {
  const DescriptionFields(
      {super.key,
      required this.arDescriptionController,
      required this.enDescriptionController,
      required this.trDescriptionController});
  final TextEditingController enDescriptionController;
  final TextEditingController arDescriptionController;
  final TextEditingController trDescriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidget(
          label: 'English Description',
          controller: enDescriptionController,
        ),
        const SizedBox(height: 10),
        TextFormFieldWidget(
          label: 'Turksish Description',
          controller: trDescriptionController,
        ),
        const SizedBox(height: 10),
        TextFormFieldWidget(
          label: 'Arabic Description',
          controller: arDescriptionController,
        ),
      ],
    );
  }
}
