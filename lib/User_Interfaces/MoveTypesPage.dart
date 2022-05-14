import 'package:flutter/material.dart';
import 'package:wemove/home/Mainpage.dart';
import 'package:wemove/widgets/big_text.dart';

import '../widgets/colors.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MoveTypes(),
  ));
}

class MoveTypes extends StatelessWidget {
  const MoveTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      appBar: AppBar(
        title: BigText(text:'Select Move Type', color: Colors.lightBlueAccent,),
        backgroundColor: AppColors.background,
      ),

    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}