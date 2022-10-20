import 'package:flutter/material.dart';
import 'package:food_ninja/constants/app_colors.dart';
import 'package:food_ninja/constants/assets_string.dart';
import 'package:food_ninja/utils/styles.dart';
import 'package:food_ninja/widgets/buttons.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
     final deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
                  height: deviceH*0.01,
                ),
          Image.asset(LightTheme.onboardingImage2),
          Padding(
            padding:  EdgeInsets.all(deviceH*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Food Ninja is Where Your\n Comfort Food Lives',
                  textAlign: TextAlign.center,
                  style: kTextStyle.copyWith(
                      color: AppColors.blackText,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                 SizedBox(
                  height: deviceH*0.03,
                ),
                Text(
                  'Enjoy a fast and smooth food delivery at\n your doorstep',
                  textAlign: TextAlign.center,
                  style: kTextStyle.copyWith(
                      color: AppColors.blackText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: deviceH*0.05,
                ),
                AppSmallButtons(title: 'Next', onTap: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}