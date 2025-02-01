// ignore_for_file: prefer_const_constructors

import 'package:first_project/pages/MainPage.dart';
import 'package:first_project/pages/homepage.dart';
import 'package:first_project/pages/signin.dart';
import 'package:first_project/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:first_project/pages/homepage.dart';
//import 'package:first_project/pages/animated_search.dart';
import 'package:first_project/pages/signup.dart';
// import 'package:first_proje
// ct/pages/signin.dart';

import 'package:get/get.dart';

void main() {
  runApp(Traveler());
  //run_this(with_this);
}

class Traveler extends StatelessWidget {
  Traveler({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/homepage', page: () => homepage()),
        GetPage(name: '/', page: () => mainpage()),
        GetPage(name: '/signin', page: () => signin()),
        GetPage(name: '/signup', page: () => signup()),
        GetPage(name: '/user_profile', page: () => user_profile()),
      ],
      home: mainpage(),
    );
  }
}

// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse, // Enables scrolling via mouse drag
//       };
// }
