import 'package:equatable/equatable.dart';

class StatisticsModel extends Equatable {
  final String name;
  final int count;
  final String? screenName;

  const StatisticsModel({
    required this.name,
    required this.count,
    required this.screenName,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      name: json['name'],
      count: json['count'],
      screenName: json['screenName'],
    );
  }

  @override
  List<Object?> get props => [name, count, screenName];
}
