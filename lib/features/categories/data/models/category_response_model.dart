import 'package:equatable/equatable.dart';

class CategoryResponseModel extends Equatable {
  final String id;
  final String? enName;
  final String? trName;
  final String? arName;
  final String? imageUrl;

  const CategoryResponseModel({
    required this.arName,
    required this.enName,
    required this.id,
    required this.imageUrl,
    required this.trName,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      arName: json['arName'],
      enName: json['enName'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      trName: json['trName'],
    );
  }

  @override
  List<Object?> get props => [id, enName, trName, arName, imageUrl];
}
