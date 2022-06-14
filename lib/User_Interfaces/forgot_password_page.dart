
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Utils/dimensions.dart';
import '../helper/validator.dart';
import '../widgets/colors.dart';
import '../widgets/theme_helper.dart';
import 'forgot_password_verification_page.dart';
import 'login_page.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = Dimensions.height300;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
             /* Container(
                height: _headerHeight,
              //  child: HeaderWidget(_headerHeight, true, Icons.password_rounded),
              ),*/
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(Dimensions.width25, Dimensions.height10, Dimensions.width25, Dimensions.height10),
                  padding: EdgeInsets.fromLTRB(Dimensions.width10, 0, Dimensions.width10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(Dimensions.width20, 0, Dimensions.width20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Enter Your Phone Number',
                              style: TextStyle(
                                  fontSize: Dimensions.Bigtext35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.height10,),
                            Text('Start with your country code eg. +7',
                              style: TextStyle(
                                // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.height10,),
                            Text('We will send a verification code to check your authenticity.',
                              style: TextStyle(
                                color: Colors.black38,
                                // fontSize: 20,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration("Telephone Number", "Enter your telephone number"),
                                validator: Validator().number,
                                keyboardType: TextInputType.number,

                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: Dimensions.height40),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      Dimensions.width40, Dimensions.height10, Dimensions.width40, Dimensions.height10),
                                  child: Text(
                                    "Send".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: Dimensions.Bigtext20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if(_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPasswordVerificationPage()),
                                    );
                                  }
                                },
                              ),
                            ),


                            SizedBox(height: Dimensions.height30),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Already a member? "),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
