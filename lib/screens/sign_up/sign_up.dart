import 'package:ecommerce_app/screens/sigin_in/sign_in.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/widgets/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: scrSize.width * 0.13,
          ),
          width: scrSize.width,
          height: scrSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('images/small_logo.png'),
                ),
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              Container(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: kTitleColor,
                    fontSize: scrSize.height * 0.07,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomTextFormField(
                scrSize: scrSize,
                label: "Citizenship No.",
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomTextFormField(
                scrSize: scrSize,
                label: "Email",
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomTextFormField(
                scrSize: scrSize,
                label: "Password",
                isObscure: true,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomButton(
                scrSize: scrSize,
                label: "Sign Up",
                onPressed: () {
                  print('sign up button pressed');
                },
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              FooterText(
                scrSize: scrSize,
                footerText: "Already signed in?",
                footerLinkText: "Login",
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
