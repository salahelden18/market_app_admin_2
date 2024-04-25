class AddressModel {
  String? enName;
  String? arName;
  String? trName;
  String? countryIsoCode;
  String? countryCode;
  String? id;
  String? createdAt;

  AddressModel(
      {required this.enName,
      required this.arName,
      required this.trName,
      required this.countryIsoCode,
      required this.countryCode,
      required this.id,
      required this.createdAt});

  AddressModel.fromJson(Map<String, dynamic> json) {
    enName = json['enName'] ?? json['enName'].toString();
    arName = json['arName'] ?? json['arName'].toString();
    trName = json['trName'] ?? json['trName'].toString();
    countryIsoCode =
        json['countryIsoCode'] ?? json['countryIsoCode'].toString();
    countryCode = json['countryCode'] ?? json['countryCode'].toString();
    id = json['id'] ?? json['id'].toString();
    createdAt = json['createdAt'] ?? json['createdAt'].toString();
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
}
