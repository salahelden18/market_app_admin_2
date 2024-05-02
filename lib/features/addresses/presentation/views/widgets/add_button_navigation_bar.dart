import 'package:flutter/material.dart';

import '../../../../../core/widgets/filled_button_widget.dart';

class AddButtonNavigationBarWidget extends StatelessWidget {
  const AddButtonNavigationBarWidget(
      {super.key, required this.ontap, required this.title});
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FilledButtonWidget(
        onPress: ontap,
        widget: Text(title),
      ),
    );
  }
}
