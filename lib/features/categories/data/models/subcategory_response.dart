import 'package:equatable/equatable.dart';

class SubCategoryResponseModel extends Equatable {
  final String id;
  final String? enName;
  final String? trName;
  final String? arName;
  final String? categoryId;

  const SubCategoryResponseModel(
      {required this.arName,
      required this.enName,
      required this.id,
      required this.trName,
      required this.categoryId});

  factory SubCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryResponseModel(
      arName: json['arName'],
      enName: json['enName'],
      id: json['id'],
      trName: json['trName'],
      categoryId: json['categoryId'],
    );
  }

  @override
  List<Object?> get props => [id, enName, trName, arName, categoryId];
}
