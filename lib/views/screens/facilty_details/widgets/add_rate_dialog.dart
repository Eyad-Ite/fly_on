import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/facility_details_controller.dart';
import 'package:fly_on/controllers/trip_details_controller.dart';
import 'package:fly_on/views/general_widgets/general_button.dart';
import 'package:get/get.dart';

class AddRateDialog extends StatelessWidget{

  final String facilityId;
  final String rateId;
  final String type;

  AddRateDialog({required this.type,required this.rateId,required this.facilityId});

  double rate = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close,color: AppColors.appColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            RatingBar.builder(
              initialRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 30,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rate = rating;
              },
            ),
            const SizedBox(height: 15),
            GeneralButton(
                onTap: () {
                  if(type == "add rate") {
                    Get.find<FacilityDetailsController>().addRate(facilityId, rate.toString()).then((value) {
                      if(value == true) {
                        Get.back();
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  } else {
                    Get.find<FacilityDetailsController>().updateRate(facilityId,rateId, rate.toString()).then((value) {
                      if(value == true) {
                        Get.back();
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  }
                },
                text: "Done", width: Get.mediaQuery.size.width),
          ],
        ),
      ),
    );
  }
}
