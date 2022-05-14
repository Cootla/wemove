import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/User_Interfaces/MoveTypesPage.dart';
import 'package:wemove/User_Interfaces/login_page.dart';
import 'package:wemove/home/Mainpage.dart';

import '../Utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/colors.dart';
import 'move_solution_body.dart';

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
                margin: EdgeInsets.only(top:Dimensions.padding60, bottom:Dimensions.padding15),
                padding: EdgeInsets.only(left:Dimensions.padding20, right: Dimensions.padding20),

            ),
          ),

          //showing body
          MoveTypesSamples(),


          //showing getting started button
          Container(
            color: AppColors.background,
            child: Container(
                margin: EdgeInsets.only(top:Dimensions.padding100, bottom:Dimensions.padding5),
                //padding: EdgeInsets.only(left:Dimensions.padding20, right: Dimensions.padding20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white,
                    shadowColor: Colors.lightGreenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.padding30)),
                    minimumSize: Size(Dimensions.padding300, Dimensions.padding50),
                  ),
                  child:  BigText(text: "GET STARTED", color: Colors.white, size: Dimensions.Bigtext20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
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