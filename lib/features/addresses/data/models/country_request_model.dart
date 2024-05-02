import 'package:equatable/equatable.dart';

class CountryRequestModel extends Equatable {
  final String? enName;
  final String? arName;
  final String? trName;
  final String? countryIsoCode;
  final String? countryCode;

  const CountryRequestModel({
    required this.enName,
    required this.arName,
    required this.trName,
    required this.countryIsoCode,
    required this.countryCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enName'] = enName;
    data['arName'] = arName;
    data['trName'] = trName;
    data['countryIsoCode'] = countryIsoCode;
    data['countryCode'] = countryCode;
    return data;
  }

  @override
  List<Object?> get props =>
      [enName, arName, trName, countryCode, countryIsoCode];
}
