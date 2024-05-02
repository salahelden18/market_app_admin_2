class AddAddressModel {
  String? enName;
  String? arName;
  String? trName;
  String? countryIsoCode;
  String? countryCode;

  AddAddressModel({
    required this.enName,
    required this.arName,
    required this.trName,
    required this.countryIsoCode,
    required this.countryCode,
  });

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    enName = json['enName'] ?? json['enName'].toString();
    arName = json['arName'] ?? json['arName'].toString();
    trName = json['trName'] ?? json['trName'].toString();
    countryIsoCode =
        json['countryIsoCode'] ?? json['countryIsoCode'].toString();
    countryCode = json['countryCode'] ?? json['countryCode'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enName'] = enName;
    data['arName'] = arName;
    data['trName'] = trName;
    data['countryIsoCode'] = countryIsoCode;
    data['countryCode'] = countryCode;
    return data;
  }
}
