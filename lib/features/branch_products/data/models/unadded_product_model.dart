import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/categories/data/models/category_response_model.dart';
import 'package:market_app_web_2/features/categories/data/models/subcategory_response.dart';

class UnAddedProductModel extends Equatable {
  final String id;
  final String? enName;
  final String? trName;
  final String? arName;
  final List<String> images;
  final CategoryResponseModel? category;
  final SubCategoryResponseModel? subCategory;

  const UnAddedProductModel({
    required this.id,
    this.enName,
    this.trName,
    this.arName,
    required this.images,
    this.category,
    this.subCategory,
  });

  factory UnAddedProductModel.fromJson(Map<String, dynamic> json) {
    return UnAddedProductModel(
      id: json['id'],
      enName: json['enName'],
      trName: json['trName'],
      arName: json['arName'],
      images: List<String>.from(json['images']),
      category: json['category'] != null
          ? CategoryResponseModel.fromJson(json['category'])
          : null,
      subCategory: json['subCategory'] != null
          ? SubCategoryResponseModel.fromJson(json['subCategory'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        enName,
        trName,
        arName,
        images,
        category,
        subCategory,
      ];
}
