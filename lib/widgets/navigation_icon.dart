import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class NavigationIcon extends StatelessWidget {
  NavigationIcon({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: kTitleColor,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: child,
      ),
    );
  }
}
