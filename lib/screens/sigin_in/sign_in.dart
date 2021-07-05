import 'dart:convert';

import 'package:ecommerce_app/backend/login_api.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up.dart';
import 'package:ecommerce_app/widgets/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //this key uniquely identifies the form Widget and allows validation of the form
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
            color: kBackgroundColor,
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
                          controller: emailController,
                          scrSize: scrSize,
                          label: 'Email',
                          validationMessage: "Please enter email",
                        ),
                        SizedBox(
                          height: scrSize.height * 0.055,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          scrSize: scrSize,
                          label: 'Password',
                          isObscure: true,
                          textInputAction: TextInputAction.done,
                          validationMessage: 'Please enter password',
                        ),
                        SizedBox(
                          height: scrSize.height * 0.055,
                        ),
                        CustomButton(
                            scrSize: scrSize,
                            label: "Sign In",
                            onPressed: () async {
                              if (emailController.text.trim() == '' ||
                                  passwordController.text == '') {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: AlertDialog(
                                        titleTextStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: scrSize.height * 0.035),
                                        title: Text('Login failed!'),
                                        content: ListBody(
                                          children: <Widget>[
                                            Text(
                                                'Please enter both email and password'),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Okay',
                                                style: TextStyle(
                                                  color: kButtonColor,
                                                  fontSize:
                                                      scrSize.height * 0.03,
                                                ),
                                              ))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                http.Response response = await LoginApi(
                                        emailController.text,
                                        passwordController.text)
                                    .login();
                                print(response.body);
                              }
                            }),
                        SizedBox(
                          height: scrSize.height * 0.055,
                        ),
                        FooterText(
                            scrSize: scrSize,
                            footerText: 'Not registered yet?',
                            footerLinkText: 'Register',
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            }),
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
