// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:first_project/pages/signin.dart';
import 'package:get/get.dart';
import 'package:first_project/pages/signup.dart';
import 'package:first_project/pages/homepage.dart';
import 'package:first_project/pages/user_profile.dart';
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class mainpage extends StatefulWidget {
  mainpage({super.key});

  @override
  State<mainpage> createState() => mainpageState();
}

class mainpageState extends State<mainpage> {
  late bool sinup = false;
  late int index;
  @override
  void initState() {
    super.initState();
    index = 0;
    sinup = false;
  }

  // List<Widget> _pages = [
  //   homepage(),
  //   signin(),
  //   signup(),
  //   user_profile(),
  // ];
  Widget _get_body(int ind) {
    if (ind == 0)
      return homepage();
    else if (!Auth.isLoggedIn) {
      if (sinup)
        return signup();
      else
        return signin();
    } else
      return user_profile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _get_body(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          if (!Auth.isLoggedIn)
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
          else
            BottomNavigationBarItem(icon: usericon(), label: usericon.name),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}

class usericon extends StatelessWidget {
  const usericon({super.key});
  static String name = "From_database";
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    );
  }
}
