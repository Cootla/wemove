import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/Utils/dimensions.dart';
import 'package:wemove/widgets/big_text.dart';
import 'package:wemove/widgets/small_text.dart';

import '../widgets/colors.dart';

class MoveTypesSamples extends StatefulWidget {
  const MoveTypesSamples({Key? key}) : super(key: key);

  @override
  State<MoveTypesSamples> createState() => _MoveTypesSamplesState();
}

class _MoveTypesSamplesState extends State<MoveTypesSamples> {
  PageController pageController = PageController(viewportFraction:0.95);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height= Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue= pageController.page!;

      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            //color: Colors.red,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                }
            )
        ),
        new DotsIndicator(
          dotsCount: 3,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor1,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          )
        )
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if (index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1){
      var currScale= _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1) {
      var currScale = 1 - (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }

   return Transform(
     transform: matrix,
     child: Stack(
       children: [
        Container(
        height: Dimensions.pageView1,
        //width: 22,
       margin: EdgeInsets.only(left:5, right:5),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color: Color(0xFF69c5df),
           image: DecorationImage(
               fit: BoxFit.cover,
               image: AssetImage(
                   "assets/image/move1.webp"
               )
           )
       ),
     ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
             height:Dimensions.pageViewTextContainer,
             margin: EdgeInsets.only(left:20, right:20, bottom:5),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white24,
                 /*boxShadow: [
                   BoxShadow(
                    // color: Color(0xFFffffff3d),
                       blurRadius: 1.0,
                     offset: Offset(0,5)
                   )



               ]*/


             ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                children: [
                  BigText(text: "Small Moves",  size: 35,  color: AppColors.iconColor2, fontWeight: FontWeight.bold),
                  SmallText(text: "Moving from one place to another made easy.\n"
                      "You need to change an apartment, just a click away", size:15),
                  SizedBox(height: Dimensions.height10,),
                ]
              )
            )
           ),
        ),
       ],
     ),
   );
  }
}
