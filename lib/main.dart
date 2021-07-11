import 'package:ecommerce_app/backend/services.dart';
import 'package:ecommerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce_app/constants/constants.dart';

bool? _status;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//n navigation bar color
    systemNavigationBarColor: kTitleColor,
    statusBarColor: kTitleColor, // status bar color
  ));
  _status = await ServicePref().getStatus();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Center(
          child: SplashScreen(_status ?? false),
        ),
      ),
    );
  }
}
