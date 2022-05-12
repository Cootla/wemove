import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/widgets/big_text.dart';
import 'package:wemove/widgets/small_text.dart';
import 'move_solution_body.dart';


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
      body: Column(
        children: [

          //showing header
          Container(
            //color: Colors.brown,
            child: Container(
              margin: EdgeInsets.only(top:45, bottom:15),
              padding: EdgeInsets.only(left:20, right: 20),
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
                        width: 45,
                        height: 45,
                        child: Icon(Icons.search, color:Colors.white),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),

                  ],
                )
            ),
          ),

          //showing body
          MoveTypesSamples(),
        ],
      ),
    );

  }
}
