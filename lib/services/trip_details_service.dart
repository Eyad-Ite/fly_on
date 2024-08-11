import 'package:fly_on/constants/api_paths.dart';
import 'package:get/get.dart';
import 'package:fly_on/helper/api.dart';


class TripDetailsService {

  Future<Response> tripDetails(String tripId) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.tripDetailsUrl,body: {"id" : tripId});
  }

  Future<Response> addReview(String tripId,String review) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.addReviewUrl,body: {"trip_id" : tripId,"comment": review});
  }

  Future<Response> deleteReview(String reviewId) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.deleteReviewUrl,body: {"id" : reviewId});
  }

  Future<Response> addAppointment(String tripId,String numberOfPlaces) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.addAppointmentUrl,body: {"trip_id" : tripId,"number_of_places": numberOfPlaces});
  }

}