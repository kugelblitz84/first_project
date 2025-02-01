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
  String _err_msg_mail = '', _err_msg_pass = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background image
        Positioned.fill(
          child: Image.network(
            'https://www.tripstins.com/assets/sunamganj-BKoa7yPz.webp',
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
        Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.07, bottom: 10),
                child: Text(
                  'Wellcome Back👋',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 11.0, left: 11.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Lorem Ipsum demo text ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _mailCont,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(143, 255, 255, 255)),
                            labelStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 236, 226, 248)),
                            errorText:
                                _err_msg_mail.isEmpty ? null : _err_msg_mail,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(139, 147, 248,
                                    150), // Border color when focused
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.5))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _mailCont,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'At least 8 Characters',
                            hintStyle: TextStyle(
                                color:
                                    const Color.fromARGB(153, 255, 255, 255)),
                            labelStyle: TextStyle(
                                color:
                                    const Color.fromARGB(255, 236, 226, 248)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(139, 147, 248,
                                    150), // Border color when focused
                                width: 2,
                              ),
                            ),
                            errorText:
                                _err_msg_pass.isEmpty ? null : _err_msg_pass,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.5))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width * 0.9,
                        //height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                splashFactory: InkRipple.splashFactory,
                                overlayColor: Colors.black,
                                backgroundColor:
                                    const Color.fromARGB(118, 0, 0, 0)),
                            onPressed: () {
                              if (_mailCont.text.isEmpty) {
                                setState(() {
                                  _err_msg_mail = 'Email cannot be emty';
                                });
                              } else if (_passCont.text.isEmpty) {
                                setState(() {
                                  _err_msg_pass = 'Please provide a password';
                                });
                              } else {
                                // login process here
                              }
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                ' Forgot Password?',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 255, 223, 223)),
                              ))),
                    ],
                  ),
                )),
              )
            ],
          ),
        )
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
