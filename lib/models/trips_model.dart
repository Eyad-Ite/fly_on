
class TripsModel {
  int? id;
  String? name;
  String? photo;
  double? rate;
  int? offer;
  int? favourite;

  TripsModel({
    this.id,
    this.name,
    this.photo,
    this.rate,
    this.offer,
    this.favourite
  });

  TripsModel.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    name = json["name"];
    photo = json["photo"];
    rate = json["rate"]?.toDouble();
    offer = json["offer"];
    favourite = json["favourite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["name"] = this.name;
    data["photo"] = this.photo;
    data["rate"] = this.rate;
    data["offer"] = this.offer;
    data["favourite"] = this.favourite;
    return data;
  }
}
