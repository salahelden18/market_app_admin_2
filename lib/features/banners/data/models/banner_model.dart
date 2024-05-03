import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int id;
  final String imageUrl;
  final int? bannerType;
  final String? url;
  final int? productId;
  final bool isActive;
  final DateTime createdAt;

  const BannerModel({
    required this.id,
    required this.imageUrl,
    this.bannerType,
    this.url,
    this.productId,
    required this.isActive,
    required this.createdAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      bannerType: json['bannerType'],
      url: json['url'],
      productId: json['productId'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  List<Object?> get props =>
      [id, imageUrl, bannerType, url, productId, isActive, createdAt];
}
