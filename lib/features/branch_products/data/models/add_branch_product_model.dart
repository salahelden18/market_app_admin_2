import 'package:equatable/equatable.dart';

class AddBranchProductModel extends Equatable {
  final String productId;
  final String branchId;
  final int stock;
  final double price;
  final int? discountTypes;
  final double? discountValue;
  final int branchSubCategoryId;

  const AddBranchProductModel(
      {required this.productId,
      required this.branchId,
      required this.stock,
      required this.price,
      required this.discountTypes,
      required this.discountValue,
      required this.branchSubCategoryId});

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "stock": stock,
      "price": price,
      "discountValue": discountValue,
      "discountTypes": discountTypes,
      "branchSubCategoryId": branchSubCategoryId,
      "branchId": branchId,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [
        productId,
        branchId,
        stock,
        price,
        discountTypes,
        discountValue,
        branchSubCategoryId,
      ];
}
