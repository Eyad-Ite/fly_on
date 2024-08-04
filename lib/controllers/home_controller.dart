import 'dart:convert';
import 'package:fly_on/models/countries_model.dart';
import 'package:fly_on/models/trips_model.dart';
import 'package:fly_on/services/home_service.dart';
import 'package:get/get.dart';



class HomeController extends GetxController {
  final HomeService homeService;
  HomeController({required this.homeService});
  bool isLoading = false;
  bool searchLoading = false;
  List<TripsModel> recommendedList = <TripsModel>[];
  List<TripsModel> offersList = <TripsModel>[];
  List<CountriesModel> countriesList = <CountriesModel>[];
  List<TripsModel> resultsTripsList = <TripsModel>[];

  Future<void> getHomeRecommended() async {
    isLoading = true;
    Response response = await homeService.getHomeRecommended();
    if(response.statusCode == 200) {
      recommendedList = [];
      // response.body['data'].forEach((item) {
      //   recommendedList.add(TripsModel.fromJson(item));
      // });
      for (int i=0; i < response.body['data'].length; i++) {
        recommendedList.add(TripsModel.fromJson(response.body['data'][i]));
      }
      // print('++++++++++++++++++++');
      // print(recommendedList.length);
      // print('++++++++++++++++++++');
    }
    isLoading = false;
    update();
  }

  Future<void> getHomeOffers() async {
    isLoading = true;
    Response response = await homeService.getHomeOffers();
    if(response.statusCode == 200) {
      offersList = [];
      for (int i=0; i< response.body['data'].length; i++) {
        offersList.add(TripsModel.fromJson(response.body['data'][i]));
      }
      // print('++++++++++++++++++++');
      // print(offersList.length);
      // print('++++++++++++++++++++');
    }
    isLoading = false;
    update();
  }

  Future<void> getHomeCountries() async {
    isLoading = true;
    Response response = await homeService.getHomeCountries();
    if(response.statusCode == 200) {
      countriesList = [];
      for (int i=0; i< response.body['data'].length; i++) {
        countriesList.add(CountriesModel.fromJson(response.body['data'][i]));
      }
      // print('++++++++++++++++++++');
      // print(countriesList.length);
      // print('++++++++++++++++++++');
    }
    isLoading = false;
    update();
  }

  Future<bool> searchHomeCountries(String query) async {
    searchLoading = true;
    update();
    Response response = await homeService.searchHomeTrips(query);
    if(response.statusCode == 200) {
      resultsTripsList = [];
      if(response.body['data'] == null) {} else {
        for (int i=0; i< response.body['data'].length; i++) {
          resultsTripsList.add(TripsModel.fromJson(response.body['data'][i]));
        }
      }
      searchLoading = false;
      update();
      return true;
    } else {
      searchLoading = false;
      return false;
    }
  }

  Future<void> searchTrip(String field) async {
    searchLoading = true;
    update();
    Response response = await homeService.searchTrip(field);
    if (response.statusCode == 200) {
      resultsTripsList = [];
      for (int i = 0; i < response.body['data'].length; i++) {
        resultsTripsList.add(TripsModel.fromJson(response.body['data'][i]));
      }
    }
    searchLoading = false;
    update();
  }
}


