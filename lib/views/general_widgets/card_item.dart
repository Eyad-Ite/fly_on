import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/helper/app_routes.dart';
import 'package:fly_on/models/trips_model.dart';
import 'package:get/get.dart';


class CardItem extends StatelessWidget {

  final TripsModel tripsModel;
  final String type;
  final int index;

  CardItem({
    required this.tripsModel,
    required this.type,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
                Get.toNamed(AppRoutes.tripDetails, parameters: {'id': index.toString()});
                // Get.toNamed(AppRoutes.tripDetails);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                   Stack(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(12),
                         child: Image.network(tripsModel.photo!, height: 140,
                             width: double.maxFinite, fit: BoxFit.cover),
                       ),
                       type == "country facilities" ? const Center() :
                       Positioned(
                         top: 10,
                         right: 10,
                         child: Icon(tripsModel.favourite == 1 ? Icons.favorite : Icons.favorite_border,color: AppColors.appColor),
                       )
                     ],
                   ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                      Expanded(
                        child: Text(tripsModel.name!,
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
                          initialRating: tripsModel.rate!,
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










  }
}