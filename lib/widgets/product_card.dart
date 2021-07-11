import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
  final int id;
  final String name;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: scrSize.width * 0.12, vertical: scrSize.height * 0.02),
      padding: EdgeInsets.all(scrSize.width * 0.04),
      width: scrSize.width * 0.04,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE0DFE2),
            offset: Offset(10, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$$price',
                style: TextStyle(
                  color: kButtonColor,
                  fontSize: scrSize.height * 0.03,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image.asset(
                'images/titan.png',
                width: scrSize.width * 0.5,
              ),
            ],
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: scrSize.height * 0.032,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
                fontSize: scrSize.height * 0.024, color: klightTextColor),
          ),
          SizedBox(height: scrSize.height * 0.02),
          CustomButton(
            fontScale: 0.03,
            widthScale: 0.4,
            heightScale: 0.06,
            scrSize: scrSize,
            label: "Add to cart",
            onPressed: () {
              print(id.toString());
            },
          )
        ],
      ),
    );
  }
}
