import 'package:equatable/equatable.dart';
import 'package:market_app_web_2/core/models/pagination_model.dart';
import 'package:market_app_web_2/features/branch_products/data/models/branch_product_model.dart';

class AllBranchProductsModel extends Equatable {
  final List<BranchProductModel> products;
  final PaginationModel paginationModel;

  const AllBranchProductsModel({
    required this.paginationModel,
    required this.products,
  });

  factory AllBranchProductsModel.fromJson(Map<String, dynamic> json) {
    return AllBranchProductsModel(
      paginationModel: PaginationModel.fromJson(json['pagination']),
      products: List<BranchProductModel>.from(
        json['products'].map((e) => BranchProductModel.fromJson(e)),
      ),
    );
  }

  @override
  List<Object?> get props => [paginationModel, products];
}
