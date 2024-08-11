import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/home_controller.dart';
import 'package:fly_on/helper/app_routes.dart';
import 'package:fly_on/views/general_widgets/custom_appbar.dart';
import 'package:fly_on/views/general_widgets/text_with_icon.dart';
import 'package:fly_on/views/general_widgets/general_list_view.dart';
import 'package:fly_on/views/screens/home/widgets/home_search.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getHomeRecommended();
    Get.find<HomeController>().getHomeOffers();
    Get.find<HomeController>().getHomeCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<HomeController>(builder: (homeController) {
          return SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomAppBar(isFloating: true),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        const SizedBox(height: 15),
                        HomeSearch(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextWithIcon(
                              text: "Recommended",
                              isIcon: true,
                              onTap: () {
                                // todo
                              }
                          ),
                        ),
                        const SizedBox(height: 10),
                        GeneralListView(list: homeController.recommendedList,type: "recommended"),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextWithIcon(
                              text: "Offers",
                              isIcon: true,
                              onTap: () {
                                // todo
                              }
                          ),
                        ),
                        const SizedBox(height: 10),
                        GeneralListView(list: homeController.offersList,type: "offers"),
                        const SizedBox(height: 30),
                        const Text("Countries", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                        const SizedBox(height: 20),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 10,
                          runSpacing: 20,
                          children: homeController.countriesList.map((e) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.countryDetails, parameters: {'id': e.id.toString()});
                              },
                              child: Container(
                                width: 120,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.whiteColor,
                                    image: DecorationImage(
                                      image: NetworkImage(e.photo!),
                                      fit: BoxFit.cover,
                                      // todo enhancement
                                      colorFilter: ColorFilter.mode(
                                          Colors.white.withOpacity(0.5), BlendMode.dstATop),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0,2),
                                      )
                                    ]
                                ),
                                child: Center(child: Text(e.name!,textAlign: TextAlign.center)),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 50),
                      ]
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}

