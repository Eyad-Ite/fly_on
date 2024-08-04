import 'package:fly_on/models/trips_model.dart';

class CountryDetailsModel {
  CountryDetailsInfo? countryDetailsInfo;
  String? message;
  int? status;

  CountryDetailsModel({
    this.countryDetailsInfo,
    this.message,
    this.status,
  });

  CountryDetailsModel.fromJson(Map<String, dynamic> json) {
    countryDetailsInfo = json["data"] != null ? CountryDetailsInfo.fromJson(json["data"]) : null;
    message = json["message"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    if(countryDetailsInfo != null) {
      data["data"] = countryDetailsInfo!.toJson();
    }
    data["message"] = this.message;
    data["status"] = this.status;
    return data;
  }
}

class CountryDetailsInfo {

  CountryInfo? countryInfo;
  List<TripsModel>? facilities;
  List<TripsModel>? trips;

  CountryDetailsInfo({
    this.countryInfo,
    this.facilities,
    this.trips,
  });

  CountryDetailsInfo.fromJson(Map<String, dynamic> json) {
    countryInfo = json["country_details"] != null ? CountryInfo.fromJson(json["country_details"]) : null;
    if(json["facilities"] != null) {
      facilities = [];
      json["facilities"].forEach((v) {
        facilities!.add(TripsModel.fromJson(v));
      });
    }
    if(json["trips"] != null) {
      trips = [];
      json["trips"].forEach((v) {
        trips!.add(TripsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    if(countryInfo != null) {
      data["country_details"] = countryInfo!.toJson();
    }
    if(facilities != null) {
      data["facilities"] = facilities!.map((v) => v.toJson()).toList();
    }
    if(trips != null) {
      data["trips"] = trips!.map((v) => v.toJson()).toList();
    }
    return data;

  }

}

class CountryInfo {

  int? id;
  String? name;
  String? photo;
  String? bio;

  CountryInfo({
    this.id,
    this.name,
    this.photo,
    this.bio,
  });

  CountryInfo.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    name = json["name"];
    photo = json["photo"];
    bio = json["bio"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["name"] = this.name;
    data["photo"] = this.photo;
    data["bio"] = this.bio;
    return data;
  }

}