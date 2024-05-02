import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final String? enName;
  final String? arName;
  final String? trName;
  final String? countryIsoCode;
  final String? countryCode;
  final String? id;
  final String? createdAt;

  const CountryModel({
    required this.enName,
    required this.arName,
    required this.trName,
    required this.countryIsoCode,
    required this.countryCode,
    required this.id,
    required this.createdAt,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      enName: json['enName'],
      arName: json['arName'],
      trName: json['trName'],
      countryIsoCode: json['countryIsoCode'],
      countryCode: json['countryCode'],
      id: json['id'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enName'] = enName;
    data['arName'] = arName;
    data['trName'] = trName;
    data['countryIsoCode'] = countryIsoCode;
    data['countryCode'] = countryCode;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }

  @override
  List<Object?> get props =>
      [enName, trName, arName, countryCode, countryIsoCode, id, createdAt];
}
