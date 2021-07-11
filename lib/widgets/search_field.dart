import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class SearchField extends StatelessWidget {
  SearchField({
    required this.scrSize,
    required this.label,
    this.isObscure = false,
    required this.validationMessage,
    this.controller,
  });
  final Size scrSize;
  final String label;
  final bool isObscure;
  final String validationMessage;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scrSize.width * 0.68,
      height: scrSize.width * 0.12,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff707070)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.only(
          left: scrSize.width * 0.03,
          top: scrSize.height * 0.001,
          bottom: scrSize.height * 0.01,
        ),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.done,
          cursorColor: kButtonColor,
          obscureText: isObscure,
          style: TextStyle(
            color: kTitleColor,
            fontSize: scrSize.height * 0.028,
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validationMessage;
            }
            return null;
          },
        ),
      ),
    );
  }
}
