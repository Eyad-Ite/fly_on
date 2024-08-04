import 'package:flutter/material.dart';
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
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        title: Text('Search Trips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Enter search term',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    homeController.searchTrip(searchController.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (_) {
                  if (homeController.searchLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (homeController.resultsTripsList.isEmpty) {
                    return Center(child: Text('No results found.'));
                  }

                  return ListView.builder(
                    itemCount: homeController.resultsTripsList.length,
                    itemBuilder: (context, index) {
                      final TripsModel trip = homeController.resultsTripsList[index];
                      return InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.tripDetails, parameters: {'id': index.toString()});
                        },
                        child: ListTile(
                          leading: Image.network(trip.photo!),
                          title: Text(trip.name!),
                          subtitle: Text('Rate: ${trip.rate}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
