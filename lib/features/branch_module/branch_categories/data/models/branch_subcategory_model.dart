import 'package:equatable/equatable.dart';
import '../../../../categories/data/models/subcategory_response.dart';

class BranchSubCategoryModel extends Equatable {
  final int id;
  final bool isEnabled;
  final int branchCategoryId;
  final SubCategoryResponseModel subCategory;

  const BranchSubCategoryModel({
    required this.branchCategoryId,
    required this.id,
    required this.isEnabled,
    required this.subCategory,
  });

  factory BranchSubCategoryModel.fromjson(Map<String, dynamic> json) {
    return BranchSubCategoryModel(
      branchCategoryId: json['branchCategoryId'],
      id: json['id'],
      isEnabled: json['isEnabled'],
      subCategory: SubCategoryResponseModel.fromJson(
        json['subCategory'],
      ),
    );
  }

  BranchSubCategoryModel copyWith({
    int? id,
    bool? isEnabled,
    int? branchCategoryId,
    SubCategoryResponseModel? subCategory,
  }) {
    return BranchSubCategoryModel(
      id: id ?? this.id,
      isEnabled: isEnabled ?? this.isEnabled,
      branchCategoryId: branchCategoryId ?? this.branchCategoryId,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  List<Object?> get props => [id, isEnabled, branchCategoryId, subCategory];
}
