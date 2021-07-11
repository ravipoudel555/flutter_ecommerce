import 'package:ecommerce_app/backend/services.dart';
import 'package:ecommerce_app/screens/sigin_in/sign_in.dart';

import 'package:ecommerce_app/widgets/navigation_icon.dart';
import 'package:ecommerce_app/widgets/product_card.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_app/test_data/data.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/constants/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Widget> itemsData = [];
  // List<String> items = [];
  // bool loading = false, allLoaded = false;

  // fetch() async {
  //   if (allLoaded) {
  //     return;
  //   }
  //   setState(() {
  //     loading = true;
  //   });

  //   await Future.delayed(Duration(milliseconds: 500));
  //   List<String> newData =
  //       items.length >= 60 ? [] : List.generate(20, (index) => "list Item");
  //   if (newData.isNotEmpty) {
  //     items.addAll(newData);
  //   }
  //   setState(() {
  //     loading = false;
  //     allLoaded = newData.isEmpty;
  //   });
  // } //end of fetch
  @override
  void initState() {
    super.initState();

    getPostsData();
  }

  void getPostsData() {
    List<dynamic> responseList = WATCH_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(ProductCard(
        id: post["id"],
        price: post["price"],
        description: post["description"],
        name: post["name"],
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    print(itemsData.length);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: kBackgroundColor,
            width: scrSize.width,
            height: scrSize.height,
            child: Column(
              children: [
                CustomAppbar(
                  scrSize: scrSize,
                  logoutFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                    ServicePref().setStatus(false);
                    ServicePref().setEmail('');
                    ServicePref().setToken('');
                  },
                ),
                SizedBox(
                  height: scrSize.height * 0.04,
                ),
                Container(
                  child: Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Best Watches',
                          style: TextStyle(
                            fontSize: scrSize.height * 0.07,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: scrSize.height * 0.04,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return itemsData[index];
                            },
                            itemCount: itemsData.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NavigationIcon(
                        child: Text(
                          'shoP',
                          style: TextStyle(
                            color: kTitleColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      NavigationIcon(
                        child: Icon(
                          Icons.shopping_cart,
                          color: kTitleColor,
                        ),
                      ),
                      NavigationIcon(
                        child: Icon(
                          Icons.person,
                          color: kTitleColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
