import 'package:flutter/material.dart';
import 'package:food_ninja/constants/app_colors.dart';
import 'package:food_ninja/utils/styles.dart';

class AppSmallButtons extends StatelessWidget {
  final String title;
  final Function() onTap;
  const AppSmallButtons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
     final deviceW = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: deviceH*0.065,
        width: deviceW*0.35,
        decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(deviceH*0.015),
            gradient: AppColors.greenGradient),
        child: Center(
          child: Text(
            title,
            style: kTextStyle.copyWith(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}


class AppLargeButtons extends StatelessWidget {
  final String title;
  
  final Function() onTap;
  const AppLargeButtons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.width;
    //final deviceH = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 57,
        width: deviceW,
        decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(15),
            gradient: AppColors.greenGradient),
        child: Center(
          child: Text(
            title,
            style: kTextStyle.copyWith(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
