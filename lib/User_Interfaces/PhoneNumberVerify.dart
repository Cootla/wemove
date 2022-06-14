import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/colors.dart';
import '../widgets/theme_helper.dart';
import 'Mainpage.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future loginUser(String phone, BuildContext context) async{
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          auth.signInWithCredential(credential).then((UserCredential result){

          //UserCredential result){
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Mainpage()
            ));
          }).catchError((e) {
            print(e);
          });

          //This callback would gets called when verification is done automaticlly
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, int? resendToken){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: AppColors.background,
                  title: Text("Number Verification"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        decoration: ThemeHelper().textInputDecoration("verification", "Enter code"),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.lightGreenAccent,
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                        UserCredential result = await auth.signInWithCredential(credential);


                        User? user = result.user;

                        if(user != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Mainpage()
                          ));
                        }else{
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){
          verificationId = verificationId;
          print(verificationId);
          print("Timeout");
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(

            color: AppColors.background,
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Verification",
                      style: TextStyle(fontSize: Dimensions.Bigtext60, fontWeight: FontWeight.bold, color:AppColors.iconColor2 ),),

                  SizedBox(height: Dimensions.height15),
                  Text("Start with your country code",
                    style: TextStyle(fontSize: Dimensions.Smalltext15, fontWeight: FontWeight.bold, color:AppColors.iconColor2 ),),


                  SizedBox(height: Dimensions.height50),
                  TextFormField(
                    decoration: ThemeHelper().textInputDecoration('Number', 'Enter your mobile number'),
                    controller: _phoneController,
                  ),

                  SizedBox(height: 16,),


                  Container(
                   // margin: EdgeInsets.fromLTRB(0, Dimensions.height10, Dimensions.width40, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        onPrimary: Colors.white,
                        shadowColor: Colors.lightGreenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimensions.width30)),
                        minimumSize: Size(Dimensions.width250, Dimensions.height50),
                      ),

                      child:  BigText(text: "submit", color: Colors.white, size: Dimensions.Bigtext20),
                      onPressed: () {
                        final phone = _phoneController.text.trim();

                        loginUser(phone, context);

                      },

                    ),


                  ),
                  SizedBox(height: Dimensions.height100),
                  Text('WeMove🚛',
                    style: TextStyle(fontSize: Dimensions.Bigtext60, fontWeight: FontWeight.bold, color:AppColors.iconColor2 ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}