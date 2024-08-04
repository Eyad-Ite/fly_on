
import 'package:fly_on/controllers/country_controller.dart';
import 'package:fly_on/controllers/trip_details_controller.dart';
import 'package:fly_on/controllers/home_controller.dart';
import 'package:fly_on/controllers/splash_controller.dart';
import 'package:fly_on/services/counrty_service.dart';
import 'package:fly_on/services/home_service.dart';
import 'package:fly_on/services/trip_details_service.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override

  void dependencies() {

    /// for controllers
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeController(homeService: Get.find()));
    Get.lazyPut(() => CountryController(countryService: Get.find()),
        fenix: true);
    Get.lazyPut(() => TripDetailsController(tripDetailsService: Get.find()),
        fenix: true);


    /// for services
    Get.lazyPut(() => HomeService());
    Get.lazyPut(() => CountryService(), fenix: true);
    Get.lazyPut(() => TripDetailsService(), fenix: true);

  }
}
