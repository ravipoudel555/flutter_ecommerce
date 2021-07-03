import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class FooterText extends StatelessWidget {
  const FooterText({
    required this.scrSize,
    required this.onPressed,
    required this.footerText,
    required this.footerLinkText,
  });

  final Size scrSize;
  final Function()? onPressed;
  final String footerText, footerLinkText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          footerText,
          style: TextStyle(
            fontSize: scrSize.height * 0.024,
            color: klightTextColor,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            footerLinkText,
            style: TextStyle(
              fontSize: scrSize.height * 0.024,
              color: kButtonColor,
            ),
          ),
        ),
      ],
    );
  }
}
