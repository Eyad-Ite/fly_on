import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/trip_details_controller.dart';
import 'package:fly_on/views/general_widgets/general_button.dart';
import 'package:fly_on/views/screens/trip_details/reviews_screen.dart';
import 'package:fly_on/views/screens/trip_details/widgets/add_review_dialog.dart';
import 'package:fly_on/views/screens/trip_details/widgets/reviews_item.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                  SizedBox(
                    width: Get.mediaQuery.size.width,
                    child: CarouselSlider(
                      items: tripDetails.photos!.map((e) {
                        return Center(
                          child: Image.network(e.photo!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Text('Failed to load image'),
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
                            tripDetails.name!,
                            style: TextStyle(fontSize: 16, fontFamily: 'Prompt'),
                          ),
                        ),
                        Text(
                          "${tripDetails.offerRatio!}%",
                          style: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.appColor),
                        ),
                        const SizedBox(width: 10),
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
                            child: Icon(tripDetails.favourite == 1 ?  Icons.favorite : Icons.favorite_border, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New price: " + tripDetails.price!.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appColor),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Old price: " + tripDetails.oldPrice!.toString(),
                          style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Start date: " + DateFormat('dd-MM-yyyy').format(DateTime.parse(tripDetails.startDate!.toString())),
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "End date: " + DateFormat('dd-MM-yyyy').format(DateTime.parse(tripDetails.endDate!.toString())),
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    Text(
                      tripDetails.bio ?? '',
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 10),
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
                    tripDetails.reviews!.isNotEmpty ?
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: tripDetails.reviews!.length > 3 ? 3 : tripDetails.reviews!.length,
                      itemBuilder: (context, index) {
                        final review = tripDetails.reviews![index];
                        return ReviewsItem(index: index,tripId: tripDetails.id.toString(),reviewsList:tripDetails.reviews!,

                        );
                      },
                    ) : const Text("No reviews yet.. start adding review"),
                    tripDetails.reviews!.isEmpty ? const Center() :
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
                            Get.to(ReviewsScreen(reviewsList: tripDetails.reviews,tripId: tripDetails.id.toString()));
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
                    (tripDetails.inProgress == true && tripDetails.inReserve == 1) ?
                    GeneralButton(
                      onTap: () {
                        Get.dialog(AddReviewDialog(tripId: tripDetails.id.toString()), barrierDismissible: true);
                      },
                      text: "Add review",
                      width: Get.mediaQuery.size.width,
                    ) : const Center(),
                    SizedBox(height: (tripDetails.inProgress == true && tripDetails.inReserve == 1) ? 20 : 10),
                    tripDetails.days!.isNotEmpty ?
                    const Text(
                      "Days",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        letterSpacing: 0.6,
                        decoration: TextDecoration.none,
                      ),
                    ) : const Center(),
                    const SizedBox(height: 10),
                    tripDetails.days!.isNotEmpty ?
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: tripDetails.days!.length,
                      itemBuilder: (context, index) {
                        return Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(tripDetails.days![index].date.toString())),
                            style: TextStyle(color: Colors.red));
                      },
                    ) : const Center(),
                    SizedBox(height: tripDetails.days!.isNotEmpty ? 10 : 0),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Number of available places",
                              style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appColor),
                            ),
                          ),
                          Text(
                            tripDetails.numberOfAvailablePlaces!.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
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

