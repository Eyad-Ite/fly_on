
import 'package:flutter/material.dart';
import 'package:fly_on/controllers/country_controller.dart';
import 'package:fly_on/helper/getx_bindings.dart';
import 'package:fly_on/views/screens/country_details/country_details_screen.dart';
import 'package:fly_on/views/screens/home/home_screen.dart';
import 'package:fly_on/views/screens/search/search_screen.dart';
import 'package:fly_on/views/screens/splash/splash_screen.dart';
import 'package:fly_on/views/screens/trip_details/reviews_sreen.dart';
import 'package:get/get.dart';

import 'helper/app_routes.dart';
import 'views/screens/trip_details/trip_details_screen.dart';

void main() {

  AppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        initialRoute: AppRoutes.home,
        debugShowCheckedModeBanner: false, getPages: [
      GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
      GetPage(name: AppRoutes.home, page: () => HomeScreen()),
      GetPage(
        name: AppRoutes.countryDetails,
        page: () => CountryDetailsScreen(countryId: Get.parameters['id']!),
      ),
      // GetPage(name: AppRoutes.countryDetails, page: () => CountryDetailsScreen(countryId: Get.parameters["id"] = "countryId")),
      GetPage(name: AppRoutes.tripDetails, page: () => TripDetails(tripId: Get.parameters['id']!)),
      GetPage(name: AppRoutes.reviews, page: () => ReviewsScreen()),
      GetPage(name: AppRoutes.search, page: () => SearchScreen()),


    ]);
  }
}
