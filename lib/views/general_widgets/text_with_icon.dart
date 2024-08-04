import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';

class TextWithIcon extends StatelessWidget {

  final String text;
  final bool isIcon;
  final VoidCallback onTap;

  TextWithIcon({
    required this.text,
    required this.isIcon,
    required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Prompt', letterSpacing: 0.6)
              )
          ),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
              ),
              color: AppColors.whiteColor,
              onPressed: onTap,
              icon: isIcon == true ?
              const Icon(Icons.arrow_forward_sharp, size: 25,color: AppColors.appColor) :
              const Text("View all" , style: TextStyle(fontSize: 15 , color: AppColors.appColor)))
        ]
    );
  }
}
