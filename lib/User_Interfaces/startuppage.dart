import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/User_Interfaces/login_page.dart';
import '../Utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/colors.dart';
import '../Mini_page/move_sample_StartPage.dart';

class Startpage extends StatefulWidget {
  const Startpage({Key? key}) : super(key: key);

  //final String title;
  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          //beginnning space
          Container(
            color: AppColors.background,
            child: Container(
                margin: EdgeInsets.only(top:Dimensions.height60, bottom:Dimensions.height15),
                padding: EdgeInsets.only(left:Dimensions.width20, right: Dimensions.width20),

            ),
          ),

          //showing body
          MoveTypesSamples(),


          //showing getting started button
          Container(
            color: AppColors.background,
            child: Container(
                margin: EdgeInsets.only(top:Dimensions.height100, bottom:Dimensions.height5),
                //padding: EdgeInsets.only(left:Dimensions.padding20, right: Dimensions.padding20),
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

                  child:  BigText(text: "GET STARTED", color: Colors.white, size: Dimensions.Bigtext20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
            ),
          ),


        ],
      ),

    );

  }
}