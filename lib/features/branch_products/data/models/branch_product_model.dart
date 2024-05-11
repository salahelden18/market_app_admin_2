import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/features/products/data/models/product_model.dart';

class BranchProductModel extends Equatable {
  final int id;
  final int? stock;
  final double? price;
  final double? discountValue;
  final int? discountTypes;
  final ProductModel? product;

  const BranchProductModel({
    required this.id,
    this.stock,
    this.price,
    this.discountValue,
    this.discountTypes,
    this.product,
  });

  factory BranchProductModel.fromJson(Map<String, dynamic> json) {
    return BranchProductModel(
      id: json['id'],
      stock: json['stock'],
      price: double.tryParse(json['price'].toString()),
      discountTypes: json['discountTypes'],
      discountValue: double.tryParse(json['discountValue'].toString()),
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
    );
  }

  bool isBranchProductHasDiscount() {
    return price != null &&
        discountTypes != null &&
        discountValue != null &&
        discountValue != 0.toDouble();
  }

  double priceAfterDiscount() {
    if (isBranchProductHasDiscount()) {
      if (discountTypes == 0) {
        double discountedPrice = price! * (1 - (discountValue! / 100));
        return discountedPrice;
      } else {
        double discountedPrice = price! - discountValue!;
        return discountedPrice >= 0 ? discountedPrice : 0;
      }
    }
    return price!;
  }

  @override
  List<Object?> get props => [
        id,
        stock,
        price,
        discountValue,
        discountTypes,
        product,
      ];
}
