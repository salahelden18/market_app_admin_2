import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/core/models/pagination_model.dart';

import 'product_model.dart';

class AllProductsModel extends Equatable {
  final List<ProductModel> products;
  final PaginationModel paginationModel;

  const AllProductsModel({
    required this.paginationModel,
    required this.products,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      paginationModel: PaginationModel.fromJson(json['pagination']),
      products: List<ProductModel>.from(
        json['products'].map((e) => ProductModel.fromJson(e)),
      ),
    );
  }

  @override
  List<Object?> get props => [paginationModel, products];
}
