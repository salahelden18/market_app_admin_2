import 'package:market_app_web_2/features/addresses/data/models/base_request_model.dart';

class CityRequetsModel extends BaseRequestModel {
  final String countryId;

  const CityRequetsModel({
    required this.countryId,
    required super.arName,
    required super.enName,
    required super.trName,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'enName': enName,
      'trName': trName,
      'arName': arName,
      'countryId': countryId,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [enName, trName, arName, countryId];
}
