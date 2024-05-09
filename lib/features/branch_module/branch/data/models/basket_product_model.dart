import 'package:equatable/equatable.dart';

import '../../../../branch_products/data/models/branch_product_model.dart';

class BasketProductModel extends Equatable {
  final int id;
  final int quantity;
  final String addedAt;
  final BranchProductModel? branchProductModel;

  const BasketProductModel({
    required this.addedAt,
    required this.branchProductModel,
    required this.id,
    required this.quantity,
  });

  factory BasketProductModel.fromJson(Map<String, dynamic> json) {
    return BasketProductModel(
      addedAt: json['addedAt'],
      branchProductModel: json['branchProduct'] != null
          ? BranchProductModel.fromJson(json['branchProduct'])
          : null,
      id: json['id'],
      quantity: json['quantity'],
    );
  }

  @override
  List<Object?> get props => [id, quantity, addedAt, branchProductModel];
}
