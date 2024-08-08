import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/country_controller.dart';
import 'package:fly_on/views/general_widgets/text_with_icon.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../general_widgets/general_list_view.dart';

class TripsAndFacilitiesScreen extends StatefulWidget {

  final String type;

  TripsAndFacilitiesScreen({required this.type});

  @override
  State<TripsAndFacilitiesScreen> createState() => _TripsAndFacilitiesScreenState();
}

class _TripsAndFacilitiesScreenState extends State<TripsAndFacilitiesScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CountryController>(builder: (countryController) {
        final list = widget.type == "trips" ? countryController.countryDetails!.countryDetailsInfo!.trips! : countryController.countryDetails!.countryDetailsInfo!.facilities!;
      
        return ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
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
                        // Get.toNamed(AppRoutes.tripDetails, parameters: {'id': trip.id.toString()});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(list[index].photo!, height: 140,
                                    width: double.maxFinite, fit: BoxFit.cover),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(list[index].name!,
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
                                    initialRating: list[index].rate!,
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
        );
      }),
    );
  }

}
