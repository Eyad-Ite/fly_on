import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';
import 'package:fly_on/controllers/country_controller.dart';
import 'package:fly_on/helper/app_routes.dart';
import 'package:fly_on/views/general_widgets/text_with_icon.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../general_widgets/general_list_view.dart';

class CountryDetailsScreen extends StatefulWidget {

  final String countryId;

  CountryDetailsScreen({required this.countryId});

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {


  @override
  void initState() {
    super.initState();
    Get.find<CountryController>().getCountryDetails(widget.countryId);
    // Get.find<CountryController>().getCountryTrips(widget.countryId);
    // Get.find<CountryController>().getCountryFacilities(widget.countryId);
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryController>(builder: (countryController) {
      return Container(
        height: Get.mediaQuery.size.height,
        width: Get.mediaQuery.size.width,
        color: Colors.white,
        child:  !countryController.isLoading ? CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: Get.mediaQuery.size.height * 0.5,
              floating: false,
              pinned: false,
              leading: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_sharp,color: AppColors.whiteColor)),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(countryController.countryDetails!.countryDetailsInfo!.countryInfo!.name!),
                titlePadding: const EdgeInsetsDirectional.all(30),
                background:  Container(
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius:const  BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: PhotoView(
                      imageProvider: NetworkImage(countryController.countryDetails!.countryDetailsInfo!.countryInfo!.photo!),
                      minScale: PhotoViewComputedScale.covered,
                      maxScale: PhotoViewComputedScale.covered * 5,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text("Description",  style: TextStyle(color: Colors.black , fontSize: 20  , fontWeight: FontWeight.bold , fontFamily: 'Prompt' , letterSpacing: 0.6 , decoration:  TextDecoration.none)),
                      const SizedBox(height: 10),
                      Text(countryController.countryDetails!.countryDetailsInfo!.countryInfo!.bio!,
                        style: TextStyle(decoration: TextDecoration.none),
                      ),
                      const SizedBox(height: 20),
                      countryController.countryDetails!.countryDetailsInfo!.trips!.isNotEmpty ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWithIcon(
                              text: "Trips",
                              isIcon: false,
                              onTap: () {
                                Get.toNamed(AppRoutes.tripsAndFacilities, parameters: {'type': "trips"});
                              }
                          ),
                          const SizedBox(height: 10),
                          GeneralListView(list: countryController.countryDetails!.countryDetailsInfo!.trips!,type: "country trips"),
                          const SizedBox(height: 20),
                        ],
                      ) : const Center(),
                      countryController.countryDetails!.countryDetailsInfo!.facilities!.isNotEmpty ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWithIcon(
                              text: "Facilities",
                              isIcon: false,
                              onTap: () {
                                Get.toNamed(AppRoutes.tripsAndFacilities, parameters: {'type': "facilities"});
                              }
                          ),
                          const SizedBox(height: 10),
                          GeneralListView(list: countryController.countryDetails!.countryDetailsInfo!.facilities!,type: "country facilities"),
                          const SizedBox(height: 20),
                        ],
                      ) : const Center(),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )  : const Center(child: CircularProgressIndicator()),
      );
    });
  }

}
