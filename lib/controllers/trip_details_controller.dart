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

}



