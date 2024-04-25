import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.isPass = false,
    required this.label,
    this.prefixIcon,
    this.textInputType,
    this.validator,
    this.controller,
    this.onChanged,
  });

  final bool isPass;
  final IconData? prefixIcon;
  final String label;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: isPass,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black,
              )
            : null,
        label: Text(label,
            style: const TextStyle(fontSize: 16, color: AppColors.black)),
        filled: true,
        fillColor: Colors.grey.shade200,
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
