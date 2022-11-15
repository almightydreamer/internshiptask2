import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/controllers/user_session_controller.dart';
import 'package:internshiptask2/pages/credentials/controllers/login_controller.dart';
import 'package:internshiptask2/pages/credentials/sign-in/login_page/login_page.dart';
import '/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final LoginController loginController = Get.find();
    Get.put(CachedSession());
    final CachedSession cachedSession = Get.find();
    loginController.retrieveCache();
    if (loginController.retrievedCache.value) {
      print(loginController.userProfile.string);
      loginController.getProfile();
      print(loginController.userProfile.string);
    }
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Obx(
          () => ((cachedSession.cacheLoaded.value)
              ? Center(child: CircularProgressIndicator())
              : ((loginController.retrievedCache.value)
                  ? const HomePage()
                  : const LoginPage())),
        ));
  }
}
