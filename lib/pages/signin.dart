// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:ui';
import 'package:first_project/pages/MainPage.dart';
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';
import 'package:first_project/pages/homepage.dart';
import 'package:first_project/pages/signup.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  Auth authenticator = Get.put(Auth());
  final TextEditingController _mailCont = TextEditingController();
  final TextEditingController _passCont = TextEditingController();
  var _obscure = true;
  String _err_msg = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background image
        Positioned.fill(
          child: Image.network(
            'https://plus.unsplash.com/premium_photo-1669731124026-84b3f596d72a?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ),

        // Original content
        Positioned(
          left: Get.width * 0.25,
          top: 125,
          child: Text(
            'Welcome Back 👋',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          left: Get.width * 0.15,
          top: 165,
          child: Text(
            'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),

        Positioned.fill(
          top: Get.height * 0.2,
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(50),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _mailCont,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "example@gmail.com",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            controller: _passCont,
                            cursorHeight: 16,
                            obscureText: _obscure,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              labelText: "Password",
                              hintText: "At least 8 characters",
                              border: OutlineInputBorder(),
                              suffix: IconButton(
                                iconSize: 16,
                                onPressed: () {
                                  setState(() {
                                    _obscure = !_obscure;
                                  });
                                },
                                icon: Icon(_obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          // Handle forgot password action
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_mailCont.text.isEmpty || _passCont.text.isEmpty){
                            _err_msg = 'All fields must be filled';
                          } else {
                            

                            final state = context
                                .findAncestorStateOfType<mainpageState>();
                            if (state != null) {
                              state.setState(() {
                                authenticator.login();
                                state.index = 0;
                              });
                            }
                          }
                          
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Or"),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: kIsWeb
                          ? OutlinedButton.icon(
                              onPressed: () {
                                // Handle Web sign-in
                              },
                              icon: Icon(Icons.login),
                              label: Text("Sign in Web"),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Colors.grey[100],
                              ),
                            )
                          : Platform.isIOS
                              ? OutlinedButton.icon(
                                  onPressed: () {
                                    // Handle Apple sign-in
                                  },
                                  icon: Icon(
                                      CupertinoIcons.person_crop_circle_fill),
                                  label: Text("Sign in with Apple"),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                )
                              : OutlinedButton.icon(
                                  onPressed: () {
                                    // Handle Google sign-in
                                  },
                                  icon: Icon(Icons.email),
                                  label: Text("Sign in with Google"),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor: Colors.grey[100],
                                  ),
                                ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle Facebook sign-in
                        },
                        icon: Icon(Icons.facebook),
                        label: Text("Sign in with Facebook"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.grey[100],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(color: Colors.amber),
                        ),
                        GestureDetector(
                          onTap: () {
                            final state = context
                                .findAncestorStateOfType<mainpageState>();
                            if (state != null) {
                              state.setState(() {
                                state.sinup = true;
                              });
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class CustomTextForPassword extends StatefulWidget {
//   const CustomTextForPassword({super.key});

//   @override
//   State<CustomTextForPassword> createState() => _CustomTextForPasswordState();
// }

// class _CustomTextForPasswordState extends State<CustomTextForPassword> {
//   var _obscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
