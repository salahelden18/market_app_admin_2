import 'package:market_app_web_2/features/addresses/data/models/base_request_model.dart';

class DistrictRequestModel extends BaseRequestModel {
  final String cityId;

  const DistrictRequestModel({
    required this.cityId,
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
      'cityId': cityId,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [enName, trName, arName, cityId];
}
