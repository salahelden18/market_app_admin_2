import 'package:equatable/equatable.dart';

class BaseRequestModel extends Equatable {
  final String enName;
  final String trName;
  final String arName;

  const BaseRequestModel({
    required this.arName,
    required this.enName,
    required this.trName,
  });

  Map<String, dynamic> toJson() {
    return {
      'enName': enName,
      'trName': trName,
      'arName': arName,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [enName, trName, arName];
}
