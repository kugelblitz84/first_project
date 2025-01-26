// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

import 'dart:ui';
import 'dart:convert';
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';
import 'package:http/http.dart' as http;
import 'package:first_project/pages/MainPage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _usernameCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _passCont = TextEditingController();
  final TextEditingController _retypeCont = TextEditingController();
  String _error_retype = '', _error_empty_field = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              color: Colors.white.withAlpha(50),
            ),
          ),
        ),
        // Fixed "Hello" text and welcome message
        Positioned(
          left: Get.width * 0.4,
          top: 80, // Set to 40 or any value based on your design
          child: Text(
            'Hello 👋',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Positioned(
          left: Get.width * 0.25,
          top: 120, // Slightly below the "Hello" text
          child: Text(
            'Welcome to the signup page',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        // Scrollable form content
        Positioned.fill(
          top: Get.height * 0.2, // Start the form below the static header
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Form content here
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(5),
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _nameCont,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle:
                                      TextStyle(color: Colors.purple[900]),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _usernameCont,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle:
                                      TextStyle(color: Colors.purple[900]),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _emailCont,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'example@gmail.com',
                            labelStyle: TextStyle(color: Colors.purple[900]),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _phoneCont,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Phone',
                                  prefix: Text("+880"),
                                  labelStyle:
                                      TextStyle(color: Colors.purple[900]),
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: false,
                          controller: _passCont,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'At least 8 characters',
                            labelStyle: TextStyle(color: Colors.purple[900]),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: false,
                          controller: _retypeCont,
                          onChanged: (value) {
                            if (value != _passCont.text && !value.isEmpty) {
                              setState(() {
                                _error_retype =
                                    "The Two Passwords Do Not Match!";
                              });
                            } else {
                              setState(() {
                                _error_retype = "";
                              });
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Re-type Password',
                            hintText: 'At least 8 characters',
                            labelStyle: TextStyle(color: Colors.purple[900]),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Text(_error_retype,
                            style: TextStyle(color: Colors.red, fontSize: 11)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_nameCont.text.isEmpty ||
                          _usernameCont.text.isEmpty ||
                          _emailCont.text.isEmpty ||
                          _phoneCont.text.isEmpty ||
                          _passCont.text.isEmpty ||
                          _retypeCont.text.isEmpty) {
                        setState(() {
                          _error_empty_field = "All Fields Must Be Filled";
                        });
                      } else {
                        Auth authenticator = Get.put(Auth());
                        final uri = Uri.https(
                            'api.tripstins.com','/api/v1/register');
                        final headers = {
                          'Content-Type': 'application/json',
                          'Accept': 'application/json',
                          //'Authorization': 'Bearer 123',
                        };

                        final body = jsonEncode({
                          "name": _nameCont.text,
                          "username": _usernameCont.text,
                          "email": _emailCont.text,
                          "phone": _phoneCont.text,
                          "password": _passCont.text,
                          "type": "user"
                        });

                        try {
                          final response = await http.post(uri,
                              headers: headers, body: body);

                          if (response.statusCode == 200 ||
                              response.statusCode == 201) {
                            print('Success: ${response.body}');
                            final state = context
                                .findAncestorStateOfType<mainpageState>();
                            if (state != null) {
                              state.setState(() {
                                authenticator.login();
                                state.index = 0;
                              });
                              
                            }
                          } else {
                            print(
                                'Failed: ${response.statusCode} - ${response.body}');
                          }
                        } catch (e) {
                          print('Error: $e');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _error_empty_field,
                    style: TextStyle(color: Colors.red, fontSize: 11),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      kIsWeb
                          ? OutlinedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.login),
                              label: Text("Sign in"),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Colors.grey[100],
                              ),
                            )
                          : Platform.isIOS
                              ? OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                      CupertinoIcons.person_crop_circle_fill),
                                  label: Text("Sign in with Apple"),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                )
                              : ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.email),
                                  label: Text("Google"),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 18),
                                    backgroundColor: Colors.grey[100],
                                  ),
                                ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.facebook),
                        label: Text("Facebook"),
                        style:
                            ElevatedButton.styleFrom(iconColor: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          final state =
                              context.findAncestorStateOfType<mainpageState>();
                          if (state != null) {
                            state.setState(() {
                              state.sinup = false;
                            });
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue[50],
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
      ],
    );
  }
}


// import http.client

// conn = http.client.HTTPSConnection("api.tripstins.com")

// payload = "{\n  \"name\": \"string\",\n  \"username\": \"string\",\n  \"email\": \"user@example.com\",\n  \"phone\": \"string\",\n  \"password\": \"stringst\",\n  \"type\": \"user\"\n}"

// headers = {
//     'Content-Type': "application/json",
//     'Accept': "application/json",
//     'Authorization': "Bearer 123"
// }

// conn.request("POST", "/api/v1/register", payload, headers)

// res = conn.getresponse()
// data = res.read()

// print(data.decode("utf-8"))
