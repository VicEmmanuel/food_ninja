import 'package:flutter/material.dart';
import 'package:food_ninja/constants/app_colors.dart';
import 'package:food_ninja/utils/styles.dart';

class EmailFormField extends StatefulWidget {
  // final String hintText;
  final TextEditingController controller;

  const EmailFormField({
    Key? key,
    // required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  final bool enabled = true;
  bool isEmailCorrect = true;
  bool isChecked = false;

  var regExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
  bool regEmailValue(String val) {
    var regExp1 = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (regExp1.hasMatch(val)) {
      setState(() {
        isChecked = true;
      });
      return true;
    } else {
      setState(() {
        isChecked = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
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
        ), //BoxSha
      ]),
     //margin: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: kTextStyle,
        controller: widget.controller,
        onChanged: (val) {
          setState(() {
            isEmailCorrect = regEmailValue(val);
          });
        },
        //style: kTextStyle.copyWith(color: Colors.black),
        showCursor: true,
        cursorColor: AppColors.green,
        validator: (value) {
          if (
              //value!.isEmpty
              !isEmailCorrect) {
            return "";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            enabled: enabled,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(deviceW * 0.06, deviceH * 0.025,
                deviceW * 0.06, deviceH * 0.025),
            hintText: "Email",
            hintStyle: kTextStyle.copyWith(
                fontSize: 12,
                color: AppColors.greyText.withOpacity(0.5),
                fontWeight: FontWeight.w600),
            suffixIcon: isChecked == false
                ? const Icon(null)
                : const Icon(
                    Icons.done,
                    color: AppColors.green,
                  ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15)),
            floatingLabelStyle: kTextStyle.copyWith(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isEmailCorrect == false
                      ? AppColors.red
                      : AppColors.grey,
                  width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: isEmailCorrect == false
                    ? AppColors.red
                    : AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: isEmailCorrect == false
                    ? AppColors.red
                    : AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(50),
            )),
      ),
    );
  }
}
