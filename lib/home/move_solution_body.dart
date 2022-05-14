import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemove/Utils/dimensions.dart';
import 'package:wemove/widgets/big_text.dart';
import 'package:wemove/widgets/small_text.dart';

import '../widgets/colors.dart';
import 'Mainpage.dart';

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
        //slider section
        Container(
            color: AppColors.background ,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                }
            )
        ),
        //dots
        new DotsIndicator(
          dotsCount: 3,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor1,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.padding5)),
          )
        ),



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
       margin: EdgeInsets.only(left:Dimensions.padding5, right:Dimensions.padding5),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(Dimensions.padding20),
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
             margin: EdgeInsets.only(left:Dimensions.padding20, right:Dimensions.padding20, bottom:Dimensions.padding5),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.padding20),
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
              color: AppColors.background,
              padding: EdgeInsets.only(top: Dimensions.padding10, left: Dimensions.padding15, right: Dimensions.padding15),
              child: Column(
                children: [
                  BigText(text: "Small Moves", color: AppColors.iconColor2, size: Dimensions.Bigtext35, fontWeight: FontWeight.bold),
                  SmallText(text: "Moving from one place to another made easy.\n"
                      "You need to change an apartment, just a click away"),
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
