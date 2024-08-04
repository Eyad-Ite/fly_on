import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFloating ;
  final double height  ;
  CustomAppBar({this.isFloating = true , this.height = 80});

  @override
  Widget build(BuildContext context) {
    return
      SliverAppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: AppColors.whiteColor),),
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Fly on',
                speed: const Duration(milliseconds: 400),
                textStyle: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 30,
                    fontFamily: 'Caveat'
                )),
          ],
          repeatForever: true,
        ),
        floating: isFloating,
        snap: false,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: AppColors.appColor,
        elevation: 0,
        shadowColor: Theme.of(context).shadowColor,
        toolbarHeight: 100,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: AppColors.whiteColor))
        ],
      );
  }

  @override
  Size get preferredSize => Size(Get.width, GetPlatform.isDesktop ?10 : Get.height);
}