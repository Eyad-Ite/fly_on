import 'package:flutter/material.dart';
import 'package:fly_on/constants/colors.dart';

class GeneralButton extends StatelessWidget {

  final VoidCallback onTap;
  final String text;
  final double width;

  GeneralButton({
    required this.onTap,
    required this.text,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.appColor,
        fixedSize: Size(width, 45),
      ), onPressed: onTap,
        child: Text(text,style: const TextStyle(color: AppColors.whiteColor))
    );
  }
}
