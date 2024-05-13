class MainProductModel {
  String? id;
  String? enName; 
  String? trName;
  String? arName;
  List<String>? images;

  MainProductModel(
      {this.id, this.enName, this.trName, this.arName, this.images});

  MainProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['enName'];
    trName = json['trName'];
    arName = json['arName'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enName'] = enName;
    data['trName'] = trName;
    data['arName'] = arName;
    data['images'] = images;
    return data;
  }
}
