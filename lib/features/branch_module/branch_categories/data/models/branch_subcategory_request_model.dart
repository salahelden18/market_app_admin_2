import 'package:equatable/equatable.dart';

class BranchSubcategoryRequestModel extends Equatable {
  final String branchId;
  final String categoryId;
  final String subCategoryId;
  final int branchCategoryId;

  const BranchSubcategoryRequestModel({
    required this.branchCategoryId,
    required this.branchId,
    required this.categoryId,
    required this.subCategoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'isEnabled': true,
      'branchId': branchId,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
      'branchCategoryId': branchCategoryId,
    };
  }

  @override
  List<Object?> get props =>
      [branchCategoryId, branchId, subCategoryId, categoryId];
}
