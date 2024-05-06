import 'package:equatable/equatable.dart';

class BranchCategoryRequestModel extends Equatable {
  final String categoryId;

  const BranchCategoryRequestModel({
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'isEnabled': true,
    };
  }

  @override
  List<Object?> get props => [categoryId];
}
