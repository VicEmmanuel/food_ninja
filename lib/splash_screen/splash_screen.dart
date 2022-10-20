import 'package:flutter/material.dart';
import 'package:food_ninja/constants/app_colors.dart';
import 'package:food_ninja/constants/assets_string.dart';
import 'package:food_ninja/onboarding/onboarding_screen_1.dart';
import 'package:food_ninja/utils/navigators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  /// future delay of 3 seconds
  Future initData() async {
    await Future.delayed(const Duration(seconds: 3),
        () => navigateReplace(context, const OnboardingScreen1()));
  }

  @override
  Widget build(BuildContext context) {
    //final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(LightTheme.patternImage),
          Center(
            child: Column(
              children: [
                Image.asset(
                  LightTheme.logoIcon,
                  width: 150,
                ),
                const Text(
                  'FoodNinja',
                  style: TextStyle(
                      color: AppColors.green,
                      fontSize: 40,
                      fontFamily: 'Viga Regular',
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  'Deliever Favorite Food',
                  style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 13,
                      fontFamily: 'Viga Regular',
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
