import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.scrSize,
    required this.label,
    required this.onPressed,
  });

  final Size scrSize;
  final String label;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: scrSize.width * 0.4,
        height: scrSize.height * 0.08,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: scrSize.height * 0.036,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
