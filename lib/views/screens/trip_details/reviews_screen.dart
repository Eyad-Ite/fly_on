import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/models/trip_details_model.dart';
import 'package:fly_on/views/screens/trip_details/widgets/reviews_item.dart';
import 'package:get/get.dart';
class ReviewsScreen extends StatefulWidget {
  final List<Reviews>? reviewsList;
  final String tripId;
  ReviewsScreen({required this.tripId,this.reviewsList});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late List<Reviews> reviewsList;
  @override
  void initState() {
    super.initState();
    reviewsList=widget.reviewsList!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appColor,

        leading: InkWell(onTap: () => Get.back(),child: const Icon(Icons.arrow_back_sharp,color: AppColors.whiteColor)),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviewsList.length,
              itemBuilder: (context,index) {
                return ReviewsItem(index: index,tripId: widget.tripId.toString(),reviewsList: reviewsList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
