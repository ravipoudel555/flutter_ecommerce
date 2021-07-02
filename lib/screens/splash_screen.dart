import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xff1C1C1C);

class SplashScreen extends StatefulWidget {
  final bool status;
  SplashScreen(this.status);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.status);
    (widget.status)
        ? Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Container(
                  child: Text('Welcome'),
                ),
              ),
            );
          })
        : Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Container(
                  child: Text('login'),
                ),
              ),
            );
          });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Center(
          child: Image(
            height: MediaQuery.of(context).size.height * 0.32,
            width: MediaQuery.of(context).size.width * 0.32,
            image: AssetImage('images/logo.png'),
          ),
        ),
      ),
    );
  }
}
