import 'package:equatable/equatable.dart';

class OrderFilterObj extends Equatable {
  final String branchId;
  final int page;
  final int pageSize;

  const OrderFilterObj({
    required this.branchId,
    this.page = 1,
    this.pageSize = 25,
  });

  toJson() {
    return {
      "page": page,
      "pageSize": pageSize,
      "branchId": branchId,
    };
  }

  @override
  List<Object?> get props => [branchId, page, pageSize];
}
