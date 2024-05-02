import 'package:equatable/equatable.dart';

class CommonModel extends Equatable {
  final String id;
  final String? enName;
  final String? trName;
  final String? arName;
  final String createdAt;

  const CommonModel(
      {required this.arName,
      required this.createdAt,
      required this.enName,
      required this.id,
      required this.trName});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      arName: json['arName'],
      createdAt: json['createdAt'],
      enName: json['enName'],
      id: json['id'],
      trName: json['trName'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName, trName, createdAt];
}
