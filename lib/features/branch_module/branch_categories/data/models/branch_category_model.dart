import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/categories/data/models/category_response_model.dart';

class BranchCategoryModel extends Equatable {
  final int id;
  final String? branchId;
  final String? categoryId;
  final CategoryResponseModel? category;
  final bool? isEnabled;

  const BranchCategoryModel({
    required this.id,
    this.branchId,
    this.category,
    this.categoryId,
    this.isEnabled,
  });

  factory BranchCategoryModel.fromjson(Map<String, dynamic> json) {
    return BranchCategoryModel(
      id: json['id'],
      branchId: json['branchId'],
      categoryId: json['categoryId'],
      category: json['category'] != null
          ? CategoryResponseModel.fromJson(json['category'])
          : null,
      isEnabled: json['isEnabled'],
    );
  }

  BranchCategoryModel copyWith({
    int? id,
    String? branchId,
    String? categoryId,
    CategoryResponseModel? category,
    bool? isEnabled,
  }) {
    return BranchCategoryModel(
      id: id ?? this.id,
      branchId: branchId ?? this.branchId,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  List<Object?> get props => [id, branchId, category, categoryId, isEnabled];
}
