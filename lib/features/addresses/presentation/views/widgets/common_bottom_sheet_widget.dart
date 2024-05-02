import 'package:flutter/material.dart';

class CommonBottomSheetWidget extends StatelessWidget {
  const CommonBottomSheetWidget(
      {super.key, required this.widget, required this.formKey});
  final Widget widget;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10,
            right: 10),
        child: Form(
          key: formKey,
          child: widget,
        ),
      ),
    );
  }
}
