import 'package:flutter/material.dart';
import 'package:food_ninja/constants/app_colors.dart';
import 'package:food_ninja/constants/assets_string.dart';
import 'package:food_ninja/onboarding/onboarding_screen_2.dart';
import 'package:food_ninja/utils/navigators.dart';
import 'package:food_ninja/utils/styles.dart';
import 'package:food_ninja/widgets/buttons.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    //final deviceW = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
                  height: deviceH*0.01,
                ),
          Image.asset(LightTheme.onboardingImage1),
          Padding(
            padding:  EdgeInsets.all(deviceH*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Find your Comfort \nFood here',
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
                  'Here You Can find a chef or dish for every\n taste and color. Enjoy!',
                  textAlign: TextAlign.center,
                  style: kTextStyle.copyWith(
                      color: AppColors.blackText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: deviceH*0.05,
                ),
                AppSmallButtons(title: 'Next', onTap: () =>navigatePush(context, const OnboardingScreen2()))
              ],
            ),
          )
        ],
      ),
    );
  }
}
