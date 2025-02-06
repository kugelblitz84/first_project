// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:ui';
import 'package:first_project/pages/MainPage.dart';
import 'package:first_project/pages/homepage.dart';
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';
import 'package:first_project/pages/signup.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/pages/custom_widgets/API_processes.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final TextEditingController _mailCont = TextEditingController();
  final TextEditingController _passCont = TextEditingController();
  var _obscure = true;
  String _err_msg_mail = '', _err_msg_pass = '', _button_text = 'Log in';
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
                        onChanged: (value) {
                          setState(() {
                            _err_msg_mail = '';
                          });
                        },
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
                        obscureText: _obscure,
                        onChanged: (value) {
                          setState(() {
                            _err_msg_pass = '';
                          });
                        },
                        controller: _passCont,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscure = !_obscure;
                                  });
                                },
                                icon: Icon(Icons.visibility_off)),
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
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width * 0.9,
                        //height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                splashFactory: InkRipple.splashFactory,
                                overlayColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                backgroundColor:
                                    const Color.fromARGB(118, 0, 0, 0)),
                            onPressed: () async {
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
                                //final int stat = await api_processes.api_login('api.tripstins.com', '/api/v1/login', _mailCont.text, _passCont.text);

                                try {
                                  setState(() {
                                    _button_text = 'Logging In...';
                                  });
                                  final int stat =
                                      await api_processes.api_login(
                                          _mailCont.text, _passCont.text);
                                  switch (stat) {
                                    case 200:
                                      print('success');
                                      final Auth authenticator =
                                          Get.put(Auth());
                                      authenticator.login(context);
                                      break;
                                    case 401:
                                      setState(() {
                                        _err_msg_pass = 'Invalid credentials';
                                        _button_text = 'Log in';
                                      });
                                      break;
                                    case 422:
                                      print('Validation error: 422');
                                      setState(() {
                                        _err_msg_pass = 'Invalid input format';
                                        _button_text = 'Log in';
                                      });
                                      break;
                                    default:
                                      setState(() {
                                        _err_msg_pass =
                                            'An unexpected error occurred';
                                        _button_text = 'Log in';
                                      });
                                  }
                                } catch (e) {
                                  print('connection error ${e}');
                                }
                              }
                            },
                            child: Text(
                              _button_text,
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Row(children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              ' Create an account',
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      const Color.fromARGB(255, 255, 223, 223)),
                            )),
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
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold),
                            )),
                      ])
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
