import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/home_controller.dart';
import 'package:fly_on/helper/app_routes.dart';
import 'package:get/get.dart';

class HomeSearch extends StatelessWidget {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20  , vertical: 5),
        child: Material(
          borderRadius: BorderRadius.circular(100),
          elevation: 5,
          shadowColor: Theme.of(context).shadowColor.withOpacity(0.6),
          child: Container(
            height: 55,
            decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:5),
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                      controller: searchController,
                      cursorColor: AppColors.appColor,
                      decoration: const InputDecoration(
                      hintText: "Search your destination",
                      prefixIcon: Icon(Icons.search,color: AppColors.appColor),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {
                        Get.find<HomeController>().searchHomeCountries(value).then((value) {
                          if(value == true) {
                            Get.toNamed(AppRoutes.search);
                          }
                          searchController.clear();
                        });

                      },
                  )
                ),
                !Get.find<HomeController>().searchLoading ?
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.appColor,
                    child: Icon(Icons.sort_by_alpha_sharp , color: Colors.white,),
                  ),
                ) : const Center(child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircularProgressIndicator(color: AppColors.appColor)))
              ]
              ),
            ),
          ),
        ),
      );
  }
}
