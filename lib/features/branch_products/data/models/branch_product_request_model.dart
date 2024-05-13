import 'package:equatable/equatable.dart';

class BranchProductRequestModel extends Equatable {
  final int stock;
  final double price;
  final int? discountTypes;
  final double? discountValue;

  const BranchProductRequestModel({
    required this.discountTypes,
    required this.discountValue,
    required this.price,
    required this.stock,
  });

  Map<String, dynamic> toJson() {
    return {
      'stock': stock,
      'price': price,
      'discountTypes': discountTypes,
      'discountValue': discountValue,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [
        discountTypes,
        discountValue,
        price,
        stock,
      ];
}
