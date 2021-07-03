import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.scrSize,
      required this.label,
      this.isObscure = false,
      this.textInputAction = TextInputAction.next});

  final Size scrSize;
  final String label;
  final bool isObscure;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scrSize.width * 0.9,
      height: scrSize.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff707070)),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: scrSize.width * 0.03,
          top: scrSize.height * 0.001,
          bottom: scrSize.height * 0.01,
        ),
        child: TextFormField(
          textInputAction: textInputAction,
          cursorColor: kButtonColor,
          obscureText: isObscure,
          style: TextStyle(
            color: kTitleColor,
            fontSize: scrSize.height * 0.03,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              color: klightTextColor,
              fontSize: scrSize.height * 0.024,
            ),
          ),
        ),
      ),
    );
  }
}
