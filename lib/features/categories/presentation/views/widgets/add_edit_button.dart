import 'package:flutter/material.dart';
import '../../../data/models/category_response_model.dart';

import '../../../../../core/widgets/filled_button_widget.dart';

class AddEditButtonWidget extends StatelessWidget {
  const AddEditButtonWidget(
      {super.key, required this.category, required this.onTap});

  final VoidCallback onTap;
  final CategoryResponseModel? category;

  @override
  Widget build(BuildContext context) {
    return FilledButtonWidget(
      onPress: onTap,
      widget: Text(category == null ? 'Add' : 'Edit'),
    );
  }
}
