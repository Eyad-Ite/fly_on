import 'package:get/get.dart';

import '../helper/app_routes.dart';

class SplashController extends GetxController
{
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.toNamed(AppRoutes.home);
    });
    super.onInit();
  }


}