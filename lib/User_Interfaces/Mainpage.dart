import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/widgets/big_text.dart';
import 'package:wemove/widgets/colors.dart';
import '../Mini_page/movingselectpage.dart';


class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  //final String title;
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      //header
      appBar: AppBar(
          backgroundColor: AppColors.background,
          automaticallyImplyLeading: true,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or false if you want to force your own back button every where
          title: BigText(text: "Select Move Type", color: AppColors.headtext ),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
            onPressed: () => Navigator.pop(context, false),
          )
      ),

      //body
      body: Column(
        children: [

          //showing header
        /*  Container(
            color: AppColors.background,
            child: Container(
              margin: EdgeInsets.only(top:Dimensions.padding45, bottom:Dimensions.padding15),
              padding: EdgeInsets.only(left:Dimensions.padding20, right: Dimensions.padding20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      BigText(text: "Russia", color: Colors.greenAccent),
                           Row(
                            children: [
                              SmallText(text: "Belgorod",),
                              Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.padding45,
                        height: Dimensions.padding45,
                        child: Icon(Icons.search, color:Colors.white, size: Dimensions.padding30,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.padding15),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),

                  ],
                )
            ),
          ),*/

          //showing body
        Expanded(child: SingleChildScrollView(
          child:  MoveSelectPage(),
        ))

          //)

          //showing last part
        ],
      ),
    );

  }
}
