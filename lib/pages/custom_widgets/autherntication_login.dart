import 'package:first_project/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends GetxController {
  static bool isLoggedIn = false;
  static int at_index = 0;
  final _storage = GetStorage();
  final _secure_storage = FlutterSecureStorage();
  @override
  void onInit() {
    super.onInit();
    isLoggedIn = _storage.read('login_stat') ?? false;
  }

  void login() {
    _storage.write('login_stat', true);
    isLoggedIn = true;
  }

  void logout() {
    _storage.write('login_stat', false);
    isLoggedIn = false;
  }
}
