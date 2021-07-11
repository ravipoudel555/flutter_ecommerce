import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.scrSize,
    required this.label,
    required this.onPressed,
    this.widthScale = 0.4,
    this.heightScale = 0.08,
    this.fontScale = 0.036,
  });

  final Size scrSize;
  final String label;
  final double widthScale;
  final double heightScale;
  final double fontScale;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: scrSize.width * widthScale,
        height: scrSize.height * heightScale,
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
              fontSize: scrSize.height * fontScale,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
