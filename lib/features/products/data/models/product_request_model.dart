import 'dart:io';
import 'package:equatable/equatable.dart';

class ProductRequsetModel extends Equatable {
  final String enName;
  final String? arName;
  final String? trName;
  final String? enDescription;
  final String? arDescription;
  final String? trDescription;
  final String? manufacturer;
  final String? subCategoryId;
  final List<File>? images;

  const ProductRequsetModel({
    required this.arDescription,
    required this.arName,
    required this.enDescription,
    required this.enName,
    this.images,
    required this.manufacturer,
    this.subCategoryId,
    required this.trDescription,
    required this.trName,
  });

  Map<String, dynamic> toJson() {
    return {
      'enName': enName,
      'arName': arName,
      'trName': trName,
      'enDescription': enDescription,
      'arDescription': arDescription,
      'trDescription': trDescription,
      'manufacturer': manufacturer,
      'subCategoryId': subCategoryId,
      'imageFiles': images,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [
        enName,
        arName,
        trName,
        enDescription,
        arDescription,
        trDescription,
        manufacturer,
        subCategoryId,
        images,
      ];
}
