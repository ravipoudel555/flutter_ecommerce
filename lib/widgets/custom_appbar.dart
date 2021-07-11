import 'package:ecommerce_app/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    required this.scrSize,
    required this.logoutFunction,
  });

  final Size scrSize;
  final Function() logoutFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kTitleColor,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: scrSize.width * 0.1,
            height: scrSize.width * 0.1,
            image: AssetImage(
              'images/logo.png',
            ),
          ),
          // TextButton(
          //     onPressed: () {
          //       ServicePref().setStatus(false);
          //     },
          //     child: Icon(
          //       Icons.logout,
          //       size: 100,
          //     )),
          SizedBox(
            width: scrSize.width * 0.03,
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              SearchField(
                scrSize: scrSize,
                label: "I'm looking for...",
                validationMessage: "",
              ),
              Image.asset(
                'images/search_icon.png',
                width: scrSize.width * 0.12,
                height: scrSize.width * 0.12,
              ),
            ],
          ),
          SizedBox(
            width: scrSize.width * 0.03,
          ),
          GestureDetector(
            onTap: logoutFunction,
            child: Icon(
              Icons.logout,
              size: scrSize.width * 0.09,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
