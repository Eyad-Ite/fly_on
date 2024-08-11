import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/facility_details_controller.dart';
import 'package:fly_on/controllers/trip_details_controller.dart';
import 'package:fly_on/views/general_widgets/general_button.dart';
import 'package:fly_on/views/screens/facilty_details/widgets/add_rate_dialog.dart';
import 'package:fly_on/views/screens/trip_details/reviews_screen.dart';
import 'package:fly_on/views/screens/trip_details/widgets/add_appointment_dialog.dart';
import 'package:fly_on/views/screens/trip_details/widgets/add_review_dialog.dart';
import 'package:fly_on/views/screens/trip_details/widgets/reviews_item.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FacilityDetails extends StatefulWidget {
  final String facilityId;

  FacilityDetails({required this.facilityId});

  @override
  State<FacilityDetails> createState() => _FacilityDetailsState();
}

class _FacilityDetailsState extends State<FacilityDetails> {
  int _currentPage = 0;
  int openDays = (-1);

  @override
  void initState() {
    super.initState();
    Get.find<FacilityDetailsController>().getFacilityDetails(widget.facilityId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<FacilityDetailsController>(builder: (facilityDetailsController) {
        if (facilityDetailsController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (facilityDetailsController.facilityDetailsModel == null) {
          return const Center(child: Text('No details available'));
        }

        final facilityDetails = facilityDetailsController.facilityDetailsModel!;

        return  SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: Get.mediaQuery.size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(facilityDetails.photo!),
                            fit: BoxFit.cover
                        )
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
                            facilityDetails.name!,
                            style: TextStyle(fontSize: 16, fontFamily: 'Prompt'),
                          ),
                        ),
                        Text("(${facilityDetails.type!})",
                          style: TextStyle(fontSize: 16, fontFamily: 'Prompt'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          initialRating: facilityDetails.totalRate!,
                          direction: Axis.horizontal,
                          ignoreGestures: true,
                          allowHalfRating: false,
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
                      facilityDetails.bio ?? '',
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 10),
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
                            facilityDetails.numberOfAvailablePlaces!.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
                            child: Text("Price per Person",
                              style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appColor),
                            ),
                          ),
                          Text(
                            facilityDetails.pricePerPerson!.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
                            child: Text("Profits",
                              style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appColor),
                            ),
                          ),
                          Text(
                            facilityDetails.profits!.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Rates",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        letterSpacing: 0.6,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    facilityDetails.rates!.isNotEmpty ?
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: facilityDetails.rates!.length,
                      itemBuilder: (context, index) {
                        final rate = facilityDetails.rates![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/person.png",width: 25,color: AppColors.appColor),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(rate.userName!,style: TextStyle(fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 3),
                                      RatingBar.builder(
                                        initialRating: double.parse(rate.rate!.toString()),
                                        direction: Axis.horizontal,
                                        ignoreGestures: true,
                                        allowHalfRating: false,
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
                                ],
                              ),
                              Row(
                                children: [
                                  rate.ableToModifyOrDelete == true ?
                                  InkWell(
                                    onTap: () {
                                      Get.dialog(AddRateDialog(type: "update rate",rateId: rate.id.toString(),facilityId: widget.facilityId.toString()), barrierDismissible: true);
                                    },
                                    child: const Icon(Icons.edit),
                                  ) : const Center(),
                                  const SizedBox(width: 15),
                                  rate.ableToModifyOrDelete == true ?
                                  InkWell(
                                    onTap: () {
                                      facilityDetailsController.deleteRate(widget.facilityId.toString(),rate.id.toString()).then((value) {});
                                    },
                                    child: const Icon(Icons.delete_outline_outlined),
                                  ) : const Center(),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ) : const Text("No reviews yet.. start adding review"),
                    const SizedBox(height: 15),
                    GeneralButton(
                      onTap: () {
                        Get.dialog(AddRateDialog(type: "add rate",rateId: "",facilityId: widget.facilityId.toString()), barrierDismissible: true);
                      },
                      text: "Add Rate",
                      width: Get.mediaQuery.size.width,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

