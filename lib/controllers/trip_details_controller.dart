import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/models/trip_details_model.dart';
import 'package:fly_on/services/trip_details_service.dart';
import 'package:get/get.dart';

class TripDetailsController extends GetxController {

  final TripDetailsService tripDetailsService;
  TripDetailsController({required this.tripDetailsService});

  TripDetailsModel? tripDetails;
  bool isLoading = false;

  Future<void> getTripDetails(String tripId) async {
    isLoading = true;
    Response response = await tripDetailsService.tripDetails(tripId);
    if(response.statusCode == 200) {
      print(response.body);
      tripDetails = TripDetailsModel.fromJson(response.body["data"]);
      print(tripDetails!.name);
    }
    isLoading = false;
    update();
  }

  Future<bool> addReview(String tripId,String review) async {
    Response response = await tripDetailsService.addReview(tripId,review);
    if(response.statusCode == 200) {
      Get.snackbar(response.body["message"],"",padding: EdgeInsets.zero);
      getTripDetails(tripId);
      return true;
    } else if (response.statusCode == 401) {
      Get.snackbar("You have login first","",backgroundColor: Colors.red.withOpacity(0.7),colorText: AppColors.whiteColor,
      margin: EdgeInsets.symmetric(horizontal: 10),padding: EdgeInsets.only(top: 15,bottom: 0,left: 15,right: 15));
      return false;
    }
    return true;
  }

  Future<bool> deleteReview(String reviewId) async {
    Response response = await tripDetailsService.deleteReview(reviewId);
    if(response.statusCode == 200) {
      Get.snackbar(response.body["message"],"",padding: EdgeInsets.zero);
      return true;
    } else if (response.statusCode == 401) {
      Get.snackbar("You have login first","",backgroundColor: Colors.red.withOpacity(0.7),colorText: AppColors.whiteColor,
          margin: EdgeInsets.symmetric(horizontal: 10),padding: EdgeInsets.only(top: 15,bottom: 0,left: 15,right: 15));
      return false;
    }
    return true;
  }

}



