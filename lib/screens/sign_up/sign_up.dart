import 'package:ecommerce_app/backend/signup_api.dart';
import 'package:ecommerce_app/screens/sigin_in/sign_in.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/widgets/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/constants.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final citizenshipNoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                  image: AssetImage('images/logo.png'),
                  width: scrSize.width * 0.1,
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
                controller: citizenshipNoController,
                scrSize: scrSize,
                label: "Citizenship No.",
                validationMessage: "Enter citizenship number",
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomTextFormField(
                controller: emailController,
                scrSize: scrSize,
                label: "Email",
                validationMessage: "Enter email",
              ),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomTextFormField(
                  controller: passwordController,
                  scrSize: scrSize,
                  label: "Password",
                  isObscure: true,
                  textInputAction: TextInputAction.done,
                  validationMessage: 'Enter password'),
              SizedBox(
                height: scrSize.height * 0.055,
              ),
              CustomButton(
                scrSize: scrSize,
                label: "Sign Up",
                onPressed: () async {
                  print('sign up button pressed');
                  if (emailController.text.trim() == '' ||
                      passwordController.text.trim() == '' ||
                      citizenshipNoController.text.trim() == '') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: AlertDialog(
                            titleTextStyle: TextStyle(
                                color: Colors.red,
                                fontSize: scrSize.height * 0.035),
                            title: Text('Signup failed!'),
                            content: ListBody(
                              children: <Widget>[
                                Text('Please fill all the fields'),
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
                                      fontSize: scrSize.height * 0.03,
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    http.Response response = await SignupApi(
                            citizenshipNo: citizenshipNoController.text,
                            email: emailController.text,
                            password: passwordController.text)
                        .signup();

                    print(response.body);
                  }
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
