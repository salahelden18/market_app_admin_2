import 'package:equatable/equatable.dart';

class SubCategoryRequest extends Equatable {
  final String enName;
  final String trName;
  final String arName;
  final String categoryId;

  const SubCategoryRequest({
    required this.arName,
    required this.enName,
    required this.trName,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'enName': enName,
      'trName': trName,
      'arName': arName,
      'categoryId': categoryId,
    };
  }

  @override
  List<Object?> get props => [enName, arName, trName, categoryId];
}
