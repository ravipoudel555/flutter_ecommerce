import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: scrSize.width * 0.13,
            ),
            width: scrSize.width,
            height: scrSize.height,
            color: Color(0xffF6F6F6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('images/small_logo.png'),
                  ),
                ),
                SizedBox(
                  height: scrSize.height * 0.02,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: scrSize.height * 0.08),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: kTitleColor,
                      fontSize: scrSize.height * 0.07,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        CustomTextFormField(
                          scrSize: scrSize,
                          label: 'Email',
                        ),
                        SizedBox(
                          height: scrSize.height * 0.055,
                        ),
                        CustomTextFormField(
                          scrSize: scrSize,
                          label: 'Password',
                          isObscure: true,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: scrSize.height * 0.055,
                        ),
                        InkWell(
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
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: scrSize.height * 0.036,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            print('sign in button pressed');
                          },
                        ),
                        SizedBox(
                          height: scrSize.height * 0.055,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Not registered yet?',
                              style: TextStyle(
                                fontSize: scrSize.height * 0.024,
                                color: klightTextColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                print('register pressed');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: scrSize.height * 0.024,
                                  color: kButtonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
