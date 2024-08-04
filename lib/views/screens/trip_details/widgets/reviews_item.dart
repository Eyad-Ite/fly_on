import 'package:flutter/material.dart';
import 'package:fly_on/models/trip_details_model.dart';

class ReviewsItem extends StatelessWidget {

  final int index;
  final List<Reviews> reviewsList;

   ReviewsItem({required this.index,required this.reviewsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reviewsList[index].userName!,style: TextStyle(fontWeight: FontWeight.bold)),
                // todo later (add package)

                // const SizedBox(height: 5),
                Text(reviewsList[index].comment!),
              ],
            )
          )
        ],
      ),
    );
  }
}
