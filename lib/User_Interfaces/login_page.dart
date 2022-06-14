
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wemove/User_Interfaces/registration_page.dart';
import 'package:wemove/User_Interfaces/Mainpage.dart';
import '../Utils/dimensions.dart';
import '../helper/validator.dart';
import '../widgets/colors.dart';
import '../widgets/theme_helper.dart';
import 'PhoneNumberVerify.dart';
import 'forgot_password_page.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = Dimensions.height50;
  Key _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              height: _headerHeight,
              //child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(Dimensions.width20, Dimensions.height10, Dimensions.width20, Dimensions.height10),
                  margin: EdgeInsets.fromLTRB(Dimensions.width20, Dimensions.height10, Dimensions.width20, Dimensions.height10),// This will be the login form
                child: Column(
                  children: [
                    Text('WeMove🚛',
                      style: TextStyle(fontSize: Dimensions.Bigtext60, fontWeight: FontWeight.bold, color:AppColors.iconColor2 ),
                    ),
                    Text(
                      'Sign in into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: Dimensions.height50),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(

                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                //controller: authController.emailController,
                                validator: Validator().name,
                                keyboardType: TextInputType.name,

                    ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: Dimensions.height35),
                            Container(
                              child: TextFormField(
                                validator: Validator().password,
                                obscureText: true,
                                maxLines: 1,
                                decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: Dimensions.height15),
                            Container(
                              margin: EdgeInsets.fromLTRB(Dimensions.width10,0,Dimensions.width10,Dimensions.height20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),

                            SizedBox(height: Dimensions.height50),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(Dimensions.width40, Dimensions.height10, Dimensions.width40, Dimensions.height10),
                                  child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: Dimensions.Bigtext20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(Dimensions.width10,Dimensions.height20,Dimensions.width10,Dimensions.height20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children:   -[
                                    TextSpan(text: "Don\'t have an account? "),
                                    TextSpan(
                                      text: 'Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}