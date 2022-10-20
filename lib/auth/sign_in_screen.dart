import 'package:flutter/material.dart';
import 'package:food_ninja/constants/app_colors.dart';
import 'package:food_ninja/constants/assets_string.dart';
import 'package:food_ninja/utils/styles.dart';
import 'package:food_ninja/widgets/buttons.dart';
import 'package:food_ninja/widgets/form_fields.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  passwordFormField(deviceH, deviceW) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.grey,
          offset: const Offset(
            0,
            5,
          ),
          blurRadius: 5.0,
          spreadRadius: 0,
        ),
      ]),
      child: TextFormField(
        style: kTextStyle,
        controller: passwordController,
        showCursor: true,
        cursorColor: AppColors.green,
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            enabled: true,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(deviceW * 0.06, deviceH * 0.025,
                deviceW * 0.06, deviceH * 0.025),
            hintText: "Password",
            hintStyle: kTextStyle.copyWith(
                fontSize: 12,
                color: AppColors.greyText.withOpacity(0.5),
                fontWeight: FontWeight.w600),
            // suffixIcon: isChecked == false
            //     ? const Icon(null)
            //     : const Icon(
            //         Icons.done,
            //         color: AppColors.green,
            //       ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15)),
            floatingLabelStyle: kTextStyle.copyWith(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(50),
            )),
      ),
    );
  }

  FormField(deviceH, deviceW) {
    return Form(
      key: FormKey,
      child: Column(
        children: [
          EmailFormField(controller: emailController),
          SizedBox(
            height: 10,
          ),
          passwordFormField(deviceH, deviceW),
        ],
      ),
    );
  }

  socialButtons(deviceH, deviceW,
      {required String title,
      required String imagePath,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: deviceW * 0.01),
          height: deviceH * 0.08,
          width: deviceW / 2.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: AppColors.grey,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey,
                  offset: const Offset(
                    0,
                    10,
                  ),
                  blurRadius: 5.0,
                  spreadRadius: 0,
                ),
              ]),
          child: Center(
              child: FittedBox(
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    imagePath,
                    width: deviceH * 0.035,
                  ),
                  SizedBox(
                    width: deviceW * 0.03,
                  ),
                  Text(
                    '$title',
                    style: kTextStyle.copyWith(
                        color: AppColors.blackText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ))),
    );
  }

  submitButton(){
    return AppSmallButtons(title: "Login", onTap: (){});
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            LightTheme.patternImage,
          ),
          Padding(
            padding: EdgeInsets.only(top: deviceH * 0.064, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      LightTheme.logoIcon,
                      width: deviceH*0.2,
                    ),
                  ),
                  SizedBox(
                    height: deviceH*0.02,
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
                  ),
                  SizedBox(
                    height:  deviceH*0.045,
                  ),
                  Text(
                    'Login To Your Account',
                    style: kTextStyle.copyWith(
                        color: AppColors.blackText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormField(deviceH, deviceW),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Or Continue With',
                    style: kTextStyle.copyWith(
                        color: AppColors.blackText,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: socialButtons(deviceH, deviceW,
                            title: 'Facebook',
                            imagePath: LightTheme.facebookIcon,
                            onTap: () {}),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: socialButtons(deviceH, deviceW,
                              title: 'Google',
                              imagePath: LightTheme.googleIcon,
                              onTap: () {})),
                    ],
                  ),
                  SizedBox(
                    height: deviceH * 0.04,
                  ),
                  Text(
                    'Forgot Your Password?',
                    style: kTextStyle.copyWith(
                        color: AppColors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: deviceH * 0.04
                  ),
                  submitButton(),
                  // SizedBox(
                  //   height: deviceH * 0.01,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
