import 'dart:io';

import 'package:equatable/equatable.dart';

class CategoryRequestModel extends Equatable {
  final String enName;
  final String? trName;
  final String? arName;
  final File? image;

  const CategoryRequestModel({
    required this.arName,
    required this.enName,
    required this.trName,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'enName': enName,
      'trName': trName,
      'arName': arName,
      'image': image,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [enName, trName, arName, image];
}
