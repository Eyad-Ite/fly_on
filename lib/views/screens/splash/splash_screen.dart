import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/splash_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Fly on',
                  speed: const Duration(milliseconds: 400),
                  textStyle: const TextStyle(
                      color: Color(0xff27a4c9),
                      fontSize: 80,
                      fontFamily: 'Caveat'
                  )),
            ],
            repeatForever: true,
          ),
      const SizedBox(height: 50),
      Lottie.asset('assets/animation/airplane.json')
        ]
      ),

    );
  }
}
