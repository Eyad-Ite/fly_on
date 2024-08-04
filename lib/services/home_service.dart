import 'package:fly_on/constants/api_paths.dart';
import 'package:get/get.dart';
import 'package:fly_on/helper/api.dart';


class HomeService {

  Future<Response> getHomeRecommended() async {
    return await Api().get(
        url: ApiPaths.baseUrl + ApiPaths.getHomeRecommendedUrl);
  }

  Future<Response> getHomeOffers() async {
    return await Api().get(url: ApiPaths.baseUrl + ApiPaths.getHomeOffersUrl);
  }

  Future<Response> getHomeCountries() async {
    return await Api().get(url: ApiPaths.baseUrl + ApiPaths.getHomeCountiesUrl);
  }

  // todo check later
  Future<Response> searchHomeTrips(String query) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.searchHomeTripsUrl,
        body: {"field": query});
  }

  Future<Response> searchTrip(String field) async {
    return await Api().post(url: ApiPaths.baseUrl + ApiPaths.searchHomeTripsUrl,
        body: {"field": field});
  }
}