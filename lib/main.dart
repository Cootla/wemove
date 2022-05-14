import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wemove/home/startuppage.dart';
import 'User_Interfaces/splash_screen.dart';
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
      title: 'weMove',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SplashScreen(title: 'weMove'),
    );
  }
}

