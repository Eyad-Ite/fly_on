
class FacilityDetailsModel {
  String? type;
  String? name;
  String? photo;
  double? latitude;
  double? longitude;
  String? bio;
  int? numberOfAvailablePlaces;
  int? pricePerPerson;
  int? profits;
  double? totalRate;
  int ? countryId;
  List<Rates>? rates;


  FacilityDetailsModel({
    this.type,
    this.name,
    this.photo,
    this.latitude,
    this.longitude,
    this.bio,
    this.numberOfAvailablePlaces,
    this.pricePerPerson,
    this.profits,
    this.totalRate,
    this.countryId,
    this.rates,
  });

  FacilityDetailsModel.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    name = json["name"];
    photo = json["photo"];
    latitude = json["lat"];
    longitude = json["long"];
    bio = json["bio"];
    numberOfAvailablePlaces = json["number_of_available_places"];
    pricePerPerson = json["price_per_person"];
    profits = json["profits"];
    totalRate = json["total_rate"];
    countryId = json["country_id"];
    if(json["rates"] != null) {
      rates = [];
      json["rates"].forEach((v) {
        rates!.add(Rates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["type"] = this.type;
    data["name"] = this.name;
    data["photo"] = this.photo;
    data["lat"] = this.latitude;
    data["long"] = this.longitude;
    data["bio"] = this.bio;
    data["number_of_available_places"] = this.numberOfAvailablePlaces;
    data["price_per_person"] = this.pricePerPerson;
    data["profits"] = this.profits;
    data["total_rate"] = this.totalRate;
    data["country_id"] = this.countryId;
    if(rates != null) {
      data["rates"] = rates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rates {
  int? id;
  String? userName;
  int? rate;
  bool? ableToModifyOrDelete;

  Rates({
    this.id,
    this.userName,
    this.rate,
    this.ableToModifyOrDelete
  });


  Rates.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    userName = json["username"];
    rate = json["rate"];
    ableToModifyOrDelete = json["able_to_modify_or_delete"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["username"] = this.userName;
    data["rate"] = this.rate;
    data["able_to_modify_or_delete"] = this.ableToModifyOrDelete;
    return data;
  }
}