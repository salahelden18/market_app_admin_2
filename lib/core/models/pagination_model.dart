import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  final int totalCount;
  final int pageSize;
  final int currentPage;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginationModel({
    required this.currentPage,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.pageSize, 
    required this.totalCount,
    required this.totalPages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['currentPage'],
      hasNextPage: json['hasNextPage'],
      hasPreviousPage: json['hasPreviousPage'],
      pageSize: json['pageSize'],
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
    );
  }

  PaginationModel copyWith({
    int? totalCount,
    int? pageSize,
    int? currentPage,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) {
    return PaginationModel(
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
    );
  }

  @override
  List<Object?> get props => [
        totalCount,
        pageSize,
        currentPage,
        totalPages,
        hasNextPage,
        hasPreviousPage
      ];
}
