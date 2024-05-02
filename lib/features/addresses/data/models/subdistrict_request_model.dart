import 'package:market_app_web_2/features/addresses/data/models/base_request_model.dart';

class SubDistrictRequestModel extends BaseRequestModel {
  final String districtId;

  const SubDistrictRequestModel({
    required this.districtId,
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
      'districtId': districtId,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [enName, trName, arName, districtId];
}
