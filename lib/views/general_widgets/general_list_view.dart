import 'package:flutter/material.dart';
import 'package:fly_on/models/trips_model.dart';
import 'card_item.dart';

class GeneralListView extends StatelessWidget {

  final List<TripsModel> list;
  final String type;

GeneralListView({required this.list,required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length >= 6 ? 6 : list.length,
            itemBuilder: (context, index) {
              return CardItem(tripsModel: list[index],type: type,index: list[index].id!);
            }
        ),
      );
    }
}


