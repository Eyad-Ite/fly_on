
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/trip_details_controller.dart';
import 'package:fly_on/helper/app_routes.dart';
import 'package:fly_on/views/general_widgets/general_button.dart';
import 'package:fly_on/views/screens/trip_details/reviews_sreen.dart';
import 'package:fly_on/views/screens/trip_details/widgets/add_review_dialog.dart';
import 'package:fly_on/views/screens/trip_details/widgets/reviews_item.dart';
import 'package:get/get.dart';

class TripDetails extends StatefulWidget {
  final String tripId;

  TripDetails({required this.tripId});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Get.find<TripDetailsController>().getTripDetails(widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<TripDetailsController>(builder: (tripDetailsController) {
        if (tripDetailsController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (tripDetailsController.tripDetails == null) {
          return const Center(child: Text('No details available'));
        }

        final tripDetails = tripDetailsController.tripDetails!;

        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width,
                    child: CarouselSlider(
                      items: tripDetails.photos!.map((e) {
                        // Print the URL to debug
                        print(e); // Ensure 'e' contains the correct URL
                        return Center(
                          child: Image.network('https://th.bing.com/th/id/OIP.QZRubaNnlKSuOBwOeCwlRQHaD4?rs=1&pid=ImgDetMain' ,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text('Failed to load image'), // Display error message if image fails to load
                              );
                            },
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        height: Get.mediaQuery.size.height * 0.3,
                        initialPage: 0,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        onPageChanged: (value, _) {
                          setState(() {
                            _currentPage = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_sharp, color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
              buildCarouseIndicator(tripDetails.photos!.length),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            tripDetails.name ?? '',
                            style: TextStyle(fontSize: 16, fontFamily: 'Prompt'),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    // TODO: Replace with dynamic rating
                    Row(
                      children: [
                        Icon(Icons.star, size: 20, color: Colors.yellow.shade700),
                        Icon(Icons.star, size: 20, color: Colors.yellow.shade700),
                        Icon(Icons.star, size: 20, color: Colors.yellow.shade700),
                        Icon(Icons.star, size: 20, color: Colors.yellow.shade700),
                        Icon(Icons.star_border, size: 20, color: Colors.yellow.shade700),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        letterSpacing: 0.6,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      tripDetails.bio ?? '',
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Reviews",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        letterSpacing: 0.6,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tripDetails.reviews!.length > 3 ? 3 : tripDetails.reviews!.length,
                      itemBuilder: (context, index) {
                        final review = tripDetails.reviews![index];
                        return ReviewsItem(index: index,reviewsList:tripDetails.reviews!,

                        );
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          color: AppColors.whiteColor,
                          onPressed: () {
                            Get.to(ReviewsScreen(reviewsList: tripDetails.reviews,));
                          },
                          icon: const Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.appColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GeneralButton(
                      onTap: () {
                        Get.dialog(AddReviewDialog(), barrierDismissible: true);
                      },
                      text: "Add review",
                      width: Get.mediaQuery.size.width,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildCarouseIndicator(int length) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < length; i++)
            Container(
              height: i == _currentPage ? 8 : 6,
              width: i == _currentPage ? 8 : 6,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: i == _currentPage ? AppColors.appColor : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

