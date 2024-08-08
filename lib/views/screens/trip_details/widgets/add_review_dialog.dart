import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/trip_details_controller.dart';
import 'package:fly_on/views/general_widgets/general_button.dart';
import 'package:get/get.dart';

class AddReviewDialog extends StatelessWidget{

  final String tripId;

  AddReviewDialog({required this.tripId});

  TextEditingController reviewController = TextEditingController();

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
            TextFormField(
                cursorColor: AppColors.appColor,
                maxLines: 3,
                controller: reviewController,
                decoration: InputDecoration(
                  hintText: "add your review",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: AppColors.appColor)
                  )
                )
            ),
            const SizedBox(height: 15),
            GeneralButton(
                onTap: () {
                  Get.find<TripDetailsController>().addReview(tripId, reviewController.text).then((value) {
                    if(value == true) {
                      Get.back();
                    } else {
                      Navigator.pop(context);
                    }
                  });
                },
                text: "Done", width: Get.mediaQuery.size.width),
          ],
        ),
      ),
    );
  }
}
