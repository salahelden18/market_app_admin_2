import 'dart:io';

import 'package:equatable/equatable.dart';

class BannerRequestModel extends Equatable {
  final File image;

  const BannerRequestModel({required this.image});

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }

  @override
  List<Object?> get props => [image];
}
