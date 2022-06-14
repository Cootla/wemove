import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
//import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../Utils/dimensions.dart';

class LocationTractor extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LocationTractorState();
  }
}

class _LocationTractorState extends State<LocationTractor>{
 final MapShapeLayerController _layerController = MapShapeLayerController();
 late MapShapeSource _mapSource;

 @override
 void initState(){
   _mapSource = MapShapeSource.asset(
     "assets/usa.json",
     shapeDataField: "name",
   );
   super.initState();
 }





  @override
  Widget build(BuildContext context) {
   return Scaffold(
     /* body: SafeArea(
   child: Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.height9),
        child: Column(
          children: [
            SfMaps(
              layers: [
                MapShapeLayer(
                  //controller: _layerController,
                  source: _mapSource,

                ),
              ],
            ),

           /* FlatButton(
              child: Text ('Add Location'),
              onPressed: (){
                _layerController.insertMarker(0);
              },
            )*/
          ],
        )

      ),
    )

  ),*/

     body: Column(
       children: [
        /* Expanded(
           child: YandexMap(),
         )*/
       ],
     )
   );
    // TODO: implement build
    throw UnimplementedError();
  }
}
