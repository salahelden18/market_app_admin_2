import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../../core/widgets/text_button_widget.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../data/models/category_response_model.dart';

class EditAddImageWidget extends StatelessWidget {
  const EditAddImageWidget(
      {super.key,
      required this.category,
      required this.pickImageFn,
      required this.pickedImage});
  final CategoryResponseModel? category;
  final VoidCallback pickImageFn;
  final File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGray),
          ),
          child: pickedImage != null
              ? Image.file(pickedImage!)
              : category != null && category?.imageUrl != null
                  ? Image.network(category!.imageUrl!)
                  : null,
        ),
        const SizedBox(height: 10),
        TextButtonWidget(
            onPressed: pickImageFn,
            title: category == null ? 'Pick Image' : 'Edit Image'),
      ],
    );
  }
}
