import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.isPass = false,
    required this.label,
    required this.prefixIcon,
    this.textInputType,
    required this.validator,
    required this.controller,
  });

  final bool isPass;
  final IconData prefixIcon;
  final String label;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPass,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        label: Text(label),
        filled: true,
        fillColor: AppColors.lightGray,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
