class CountriesModel {
  int? id;
  String? name;
  String? photo;

  CountriesModel({
    this.id,
    this.name,
    this.photo,
  });

  CountriesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    photo = json["photo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["name"] = this.name;
    data["photo"] = this.photo;
    return data;
  }
}