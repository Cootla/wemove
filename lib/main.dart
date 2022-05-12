import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/Mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Mainpage(),
    );
  }
}

