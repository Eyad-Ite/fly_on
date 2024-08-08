import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:fly_on/controllers/home_controller.dart';
import 'package:fly_on/models/trips_model.dart';
import '../../../constants/colors.dart';
import '../../../helper/app_routes.dart';
import '../../../services/home_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController(homeService: HomeService()));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title: const Text('Search Results',style: TextStyle(color: AppColors.whiteColor)),
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: homeController.resultsTripsList.isNotEmpty ?
              ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.resultsTripsList.length,
                itemBuilder: (context, index) {
                  final TripsModel trip = homeController.resultsTripsList[index];
                  return SizedBox(
                      width: 220,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Card(
                          color: Colors.white.withOpacity(0.9),
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(22),
                            onTap: () {
                              Get.toNamed(AppRoutes.tripDetails, parameters: {'id': trip.id.toString()});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(trip.photo!, height: 140,
                                          width: double.maxFinite, fit: BoxFit.cover),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(trip.name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize:  15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: trip.rate!,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 16,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                  ]
                              ),
                            ),
                          ),
                        ),

                      ));
                },
              ) : Center(child: Text('No results found'))
            );
          }
        ),
      ),
    );
  }
}
