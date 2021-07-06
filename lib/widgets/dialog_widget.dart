import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    required this.scrSize,
    required this.titleText,
    required this.errorMessage,
    required this.buttonText,
    required this.onPressed,
  });

  final Size scrSize;
  final String titleText;
  final String errorMessage;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle:
          TextStyle(color: Colors.red, fontSize: scrSize.height * 0.035),
      title: Text(titleText),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(errorMessage),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                color: kButtonColor,
                fontSize: scrSize.height * 0.03,
              ),
            ))
      ],
    );
  }
}
