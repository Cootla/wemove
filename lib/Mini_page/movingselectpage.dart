import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/Utils/dimensions.dart';
import 'package:wemove/widgets/big_text.dart';
import 'package:wemove/widgets/small_text.dart';
import '../MapTrackers/usermaplocation.dart';
import '../widgets/colors.dart';
import '../User_Interfaces/Mainpage.dart';



class MoveSelectPage extends StatefulWidget {
  const MoveSelectPage({Key? key}) : super(key: key);

  @override
  State<MoveSelectPage> createState() => _MoveSelectPageState();
}

class _MoveSelectPageState extends State<MoveSelectPage> {
  List _s = [];

  List sample_images= [
    "assets/image/move1.webp",
    "assets/image/movee1.webp",
    "assets/image/storage1.webp",
    "assets/image/move1.webp",
    "assets/image/move1.webp",
    "assets/image/move1.webp",
    "assets/image/move1.webp",
    "assets/image/move1.webp",
    "assets/image/move1.webp",
    "assets/image/move1.webp",
    "assets/image/apartmentmove.webp",

  ];

  List sample_Bigtext = [
    "Big Move",
    "Big Move",
    "Big Move",
    "Small Move",
    "Big Move",
    "Big Move",
    "Big Move",
    "Big Move",
    "Big Move",
    "Big Move",
    "Apartment Move",
  ];

  List sample_Smalltext=[
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "An easy way to move 1 or 2 items around",
    "God doing marvelous things",
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

       // SizedBox(height: Dimensions.height10,),

        Container(
            height: Dimensions.height10,
            color: AppColors.background2,
        ),

        Container (
          color: AppColors.background2,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sample_images.length,
              itemBuilder: (context, index){
                return Container(
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.width10),
                    child:Row(
                        children: [
                          //for images
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationTractor()),
                              );
                            },
                            child: Container(
                                width: Dimensions.width100,
                                height: Dimensions.width100,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Dimensions.width20),
                                    bottomLeft: Radius.circular(Dimensions.width20),),
                                  // borderRadius: BorderRadius.circular(Dimensions.padding20),
                                  color:AppColors.background2,
                                  image:DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage( sample_images[index]),


                                  ),

                                )
                            ),
                          ),

                          //for text

                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LocationTractor()),
                                  );
                                },
                                child: Container(
                                    height: Dimensions.width100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(Dimensions.width20),
                                        bottomRight: Radius.circular(Dimensions.width20),),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                        padding:EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            BigText(text:sample_Bigtext[index], size: Dimensions.Bigtext25, color: AppColors.headtext,),
                                            SizedBox(height: Dimensions.width10,),
                                            SmallText(text:  sample_Smalltext[index]),

                                          ],

                                        )
                                    )
                                ),

                              )
                          )
                          ,

                        ]
                    ),
                );

              })

        )




      ],
    );
  }
}
