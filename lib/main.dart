import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wemove/User_Interfaces/startuppage.dart';
import 'package:wemove/controllers/move_samples_controllers.dart';
import 'User_Interfaces/splash_screen.dart';
import 'User_Interfaces/Mainpage.dart';
import 'package:wemove/helper/dependencies.dart' as dep;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get.find<MoveSampleController>().getMoveSampleList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'weMove',
        themeMode: ThemeMode.system,
      home: SplashScreen(title: 'weMove'),
    );
  }
}

