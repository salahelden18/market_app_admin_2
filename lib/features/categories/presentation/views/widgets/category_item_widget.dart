import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/font_style.dart';
import '../../../data/models/category_response_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});
  final CategoryResponseModel category;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: constraints.maxHeight * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.lightGray),
              image: category.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(category.imageUrl!),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            child: Text(
              category.enName!,
              style: FontStyle.size18Normal,
            ),
          ),
        ],
      ),
    );
  }
}
