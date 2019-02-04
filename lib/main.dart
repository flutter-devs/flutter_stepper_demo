import 'package:flutter/material.dart';
import 'package:flutter_stepper_demo/Constant/Constant.dart';
import 'package:flutter_stepper_demo/Screens/SplashScreen.dart';
import 'package:flutter_stepper_demo/Screens/StepperScreen.dart';

main() {

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
//    theme: new ThemeData(
//      accentColor: Colors.blue,
//      primaryColor: Colors.blue,
//      primaryColorDark: Colors.blue
//
//    ),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),
      STEPPER_SCREEN: (BuildContext context) => new StepperScreen(),



    },
  ));
}

