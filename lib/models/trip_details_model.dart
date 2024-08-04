
class TripDetailsModel {
  String? name;
  String? photo;
  int? id;
  String? bio;
  double? oldPrice;
  double? price;
  int? offerRatio;
  String? startDate;
  String? endDate;
  int? numberOfAvailablePlaces;
  String? guide;
  String? guidePhone;
  int? favourite;
  int? inReserve;
  bool? inProgress;
  List<Reviews>? reviews;
  List<TripPhotos>? photos;
  List<TripDays>? days;


  TripDetailsModel({
    this.name,
    this.photo,
    this.id,
    this.bio,
    this.oldPrice,
    this.price,
    this.offerRatio,
    this.startDate,
    this.endDate,
    this.numberOfAvailablePlaces,
    this.guide,
    this.guidePhone,
    this.favourite,
    this.inReserve,
    this.inProgress,
    this.reviews,
    this.photos,
    this.days,
  });

  TripDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    photo = json["photo"];
    id =  json["trip_id"];
    bio = json["bio"];
    oldPrice = json["old_price"]?.toDouble();
    price = json["price"]?.toDouble();
    offerRatio = json["offer_ratio"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    numberOfAvailablePlaces = json["number_of_available_places"];
    guide = json["guide"];
    guidePhone = json["guide_phone"];
    favourite = json["favourite"];
    inReserve = json["in_reserve"];
    inProgress = json["in_progress"];
    if(json["comments"] != null) {
      reviews = [];
      json["comments"].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if(json["photos"] != null) {
      photos = [];
      json["photos"].forEach((v) {
        photos!.add(TripPhotos.fromJson(v));
      });
    }
    if(json["days"] != null) {
      days = [];
      json["days"].forEach((v) {
        days!.add(TripDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["name"] = this.name;
    data["photo"] = this.photo;
    data["trip_id"] = this.id;
    data["bio"] = this.bio;
    data["old_price"] = this.oldPrice;
    data["price"] = this.price;
    data["offer_ratio"] = this.offerRatio;
    data["start_date"] = this.startDate;
    data["end_date"] = this.endDate;
    data["number_of_available_places"] = this.numberOfAvailablePlaces;
    data["guide"] = this.guide;
    data["guide_phone"] = this.guidePhone;
    data["favourite"] = this.favourite;
    data["in_reserve"] = this.inReserve;
    data["in_progress"] = this.inProgress;
    if(reviews != null) {
      data["comments"] = reviews!.map((v) => v.toJson()).toList();
    }
    if(photos != null) {
      data["photos"] = photos!.map((v) => v.toJson()).toList();
    }
    if(days != null) {
      data["days"] = days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  String? userName;
  String? comment;
  bool? ableToDelete;

  Reviews({
    this.id,
    this.userName,
    this.comment,
    this.ableToDelete
  });


  Reviews.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    userName = json["username"];
    comment = json["comment"];
    ableToDelete = json["able_to_delete"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["username"] = this.userName;
    data["comment"] = this.comment;
    data["able_to_delete"] = this.ableToDelete;
    return data;
  }
}

class TripPhotos {
  int? id;
  String? photo;
  int? tripId;
  String? createdAt;
  String? updatedAt;

  TripPhotos({
    this.id,
    this.photo,
    this.tripId,
    this.updatedAt
  });


  TripPhotos.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    photo = json["photo"];
    tripId = json["trip_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["photo"] = this.photo;
    data["trip_id"] = this.tripId;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}


class TripDays {
  int? id;
  String? date;
  String? startTime;
  String? endTime;
  int? dayId;
  int? facilityId;
  int? tripId;
  String? createdAt;
  String? updatedAt;

  TripDays({
    this.id,
    this.date,
    this.startTime,
    this.endTime,
    this.dayId,
    this.facilityId,
    this.tripId,
    this.createdAt,
    this.updatedAt,
  });


  TripDays.fromJson(Map<String, dynamic> json) {
    id =  json["id"];
    date = json["date"];
    startTime = json["start_time"];
    endTime = json["end_time"];
    dayId = json["day_id"];
    facilityId = json["facility_id"];
    tripId = json["trip_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["id"] = this.id;
    data["date"] = this.date;
    data["start_time"] = this.startTime;
    data["end_time"] = this.endTime;
    data["day_id"] = this.dayId;
    data["facility_id"] = this.facilityId;
    data["trip_id"] = this.tripId;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}