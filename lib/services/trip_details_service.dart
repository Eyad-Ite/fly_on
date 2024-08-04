import 'package:fly_on/constants/api_paths.dart';
import 'package:get/get.dart';
import 'package:fly_on/helper/api.dart';


class TripDetailsService {

  Future<Response> tripDetails(String tripId) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.tripDetailsUrl,body: {"id" : tripId});
  }

}