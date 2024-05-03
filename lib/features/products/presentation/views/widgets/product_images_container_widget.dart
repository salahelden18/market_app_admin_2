import 'dart:io';

import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';

class ProductImagesContainerWidget extends StatelessWidget {
  const ProductImagesContainerWidget(
      {super.key, required this.images, required this.deleteImage});
  final List<File> images;
  final Function(int index) deleteImage;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: List.generate(
        images.length,
        (index) => Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.lightGray)),
              child: Image.file(
                images[index],
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              child: IconButton(
                onPressed: () {
                  deleteImage(index);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
