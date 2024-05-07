import 'package:equatable/equatable.dart';

class ProductFilterModel extends Equatable {
  final String? categoryId;
  final String? subCategoryId;
  final int page;
  final int pageSize;

  const ProductFilterModel({
    this.categoryId,
    this.subCategoryId,
    this.page = 1,
    this.pageSize = 24,
  });

  ProductFilterModel copyWith({
    String? categoryId,
    String? subCategoryId,
    int? page,
    int? pageSize,
  }) {
    return ProductFilterModel(
      categoryId: categoryId ?? this.categoryId,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      subCategoryId: subCategoryId ?? this.subCategoryId,
    );
  }

  String toQueryString() {
    String query = 'page=$page&pageSize=$pageSize';

    if (categoryId != null) {   
      query += '&categoryId=$categoryId';
    }

    if (subCategoryId != null) {
      query += '&subCategoryId=$subCategoryId';
    }

    return query;
  }

  @override
  List<Object?> get props => [categoryId, subCategoryId, page, pageSize];
}
