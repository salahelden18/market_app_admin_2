import 'package:equatable/equatable.dart';

class UnAddedProductModel extends Equatable {
  final String id;
  final String? enName;
  final String? trName;
  final String? arName;
  final List<String> images;

  const UnAddedProductModel({
    required this.id,
    this.enName,
    this.trName,
    this.arName,
    required this.images,
  });

  factory UnAddedProductModel.fromJson(Map<String, dynamic> json) {
    return UnAddedProductModel(
      id: json['id'],
      enName: json['enName'],
      trName: json['trName'],
      arName: json['arName'],
      images: List<String>.from(json['images']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        enName,
        trName,
        arName,
        images,
      ];
}
