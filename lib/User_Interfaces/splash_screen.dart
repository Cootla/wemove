import 'dart:async';
import 'package:flutter/material.dart';
import '../Utils/dimensions.dart';
import 'startuppage.dart';
import '../widgets/colors.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState(){
//taking you to startuppage
    new Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Startpage()), (route) => false);
      });
    });

    new Timer(
      Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      /*decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [AppColors.background, AppColors.prime],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),*/
      color: AppColors.prime,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
             /* child: Text("weMove🚛",
                style: TextStyle(fontSize:Dimensions.Bigtext30, color: AppColors.iconColor1, fontWeight: FontWeight.bold),
              )*/
             child: ClipOval(
             child: Image.asset("assets/image/logowhite.jpg"), //put your logo here
              ),

            ),
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
             /* boxShadow: [
                BoxShadow(
                 // color: Colors.black.withOpacity(0.3),
                  blurRadius: Dimensions.padding2,
                  offset: Offset(Dimensions.padding5, Dimensions.padding3),
                  spreadRadius: Dimensions.padding2,
                )
              ]*/
            ),
          ),
        ),
      ),
    );
  }
}