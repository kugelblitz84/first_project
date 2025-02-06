import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';
import 'package:get/get.dart';
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';

class api_processes {
  static Future<int> api_login(String mail, String pass) async {
    final uri = Uri.https('api.tripstins.com', '/api/v1/login');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode({
      "email": mail,
      "password": pass,
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);
      return response.statusCode;
    } catch (e) {
      print('Error: $e');
      return -1;
    }
  }

  static Future<int> api_logout(String token) async {
    final uri = Uri.https('api.tripstins.com', '/api/v1/logout');
    final header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    try {
      final response = await http.get(uri, headers: header);
      if (response.statusCode == 200) {
        print('Success: ${response.body}');
      } else if (response.statusCode == 400) {
        print('Could not logout: token => ${token} \n ${response.body}');
      } else
        print('error 401 token => ${token}');
      return response.statusCode;
    } catch (e) {
      print('Error logging out: ${e}');
      return -1;
    }
  }

  static Future<dynamic> api_signup(String name, String username, String email,
      String pass, String phone) async {
    final uri = Uri.https('api.tripstins.com', '/api/v1/register');
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': 'Bearer 123',
    };

    final body = jsonEncode({
      "name": name,
      "username": username,
      "email": email,
      "phone": phone,
      "password": pass,
      "type": "user"
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Success: ${response.body}');
      } else {
        print('Failed: ${response.statusCode} - ${response.body}');
      }
      return response.statusCode;
    } catch (e) {
      print('Error: $e');
      return -1;
    }
  }
}
