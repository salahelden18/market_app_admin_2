import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String enName;
  final String? arName;
  final String? trName;
  final String? enDescription;
  final String? arDescription;
  final String? trDescription;
  final String createdAt;
  final String? manufacturer;
  final String? updatedAt;
  final String? subCategoryId;
  final List<String> images;

  const ProductModel({
    required this.id,
    required this.enName,
    this.arName,
    this.trName,
    this.enDescription,
    this.arDescription,
    this.trDescription,
    required this.createdAt,
    required this.images,
    this.manufacturer,
    this.updatedAt,
    this.subCategoryId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      enName: json['enName'],
      arName: json['arName'],
      trName: json['trName'],
      enDescription: json['enDescription'],
      arDescription: json['arDescription'],
      trDescription: json['trDescription'],
      createdAt: json['createdAt'],
      manufacturer: json['manufacturer'],
      updatedAt: json['updatedAt'],
      subCategoryId: json['subCategoryId'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        enName,
        arName,
        trName,
        enDescription,
        arDescription,
        trDescription,
        createdAt,
        manufacturer,
        updatedAt,
        subCategoryId,
        images,
      ];
}
