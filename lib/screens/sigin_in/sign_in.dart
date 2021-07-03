import 'package:ecommerce_app/screens/sign_up/sign_up.dart';
import 'package:ecommerce_app/widgets/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';

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
                        CustomButton(
                          scrSize: scrSize,
                          label: "Sign In",
                          onPressed: () {
                            print('sign in button pressed');
                          },
                        ),
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
