import 'dart:math';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/models/response_model.dart';
import 'package:internshiptask2/models/user_model.dart';

import '../../../controllers/user_session_controller.dart';
import '../api/api_client.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<CurrentUser> users = [];
  RxBool obscurePassword = true.obs;
  RxBool retrievedCache = false.obs;
  late Rx<UserProfile> userProfile =
      UserProfile(id: 0, fullName: '', emailAddress: '').obs;

//  RxBool loggedIn = false.obs;

  UserSession apiController = Get.put(UserSession());

  void seeButton() {
    obscurePassword.value = !obscurePassword.value;
  }

  bool dataIsFine() {
    // check if all Text Fields are completed

    return (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty);
  }

  Future<Either<DataValueOnFailure, UserProfile>> getToken() async {
    print(emailController.text);
    print(passwordController.text);
    if (dataIsFine()) {
      var userData = <String, String>{
        'email': emailController.text,
        'password': passwordController.text,
      };
      print('nice data');

      var response = await ApiClient().loginUser(userData);
      return response.fold((left) {
        print(left.error.toString());
        return Left(
            DataValueOnFailure('login_controller: loginuser 1left either'));
      }, (right) async {
        print(UserSession.requestHeaders);
        UserSession.requestHeaders['Refresh'] = ('${right.refresh}');
        UserSession.requestHeaders['Authorization'] = ('Token ${right.access}');
        print(UserSession.requestHeaders);
        return getProfile().fold((left) {
          return Left(
              DataValueOnFailure('login_controller: loginuser 2left either'));
        }, (right) {
          UserSession().updateCache();
          return Right(right);
        });
      });
    } else {
      return Left(
          DataValueOnFailure('login_controller: loginuser 3left either'));
    }
  }

  Future<Either<DataValueOnFailure, UserProfile>> getProfile() async {
    var userProfileData = await ApiClient().getUserProfileData();
    return userProfileData.fold((left) {
      print('login_controller: left ${left.error}');
      return Left(DataValueOnFailure(left.error));

      // onLoggedIn.call(false);
    }, (right) {
      //onLoggedIn.call(true);
      print('login_controller: right ${right.toString()}');
      // print('logged1 ${loggedIn.value}');
      // loggedIn.value = true;
      // print('logged2 ${loggedIn.value}');
      UserProfile userProfile = UserProfile(
          id: right.id,
          fullName: right.fullName,
          emailAddress: right.emailAddress,
          phoneNumber: right.phoneNumber,
          profilePicture: right.profilePicture);

      // emailController.clear();
      // passwordController.clear();

      return Right(userProfile);
    });
  }
  Future<void> retrieveCache() async {
      UserSession().cache.getUsersStream().listen((usersList) {
      print('Users from stream: $usersList');
      users = usersList
          .map((e) => CurrentUser(accessToken: e.accessToken, requestToken: e.requestToken, fullName: e.fullName, emailAddress: e.emailAddress, phoneNumber: e.phoneNumber))
          .toList();
    });
      print(CachedSession().cacheLoaded.value);
      CachedSession().cacheLoaded.value = true;
      print(CachedSession().cacheLoaded.value);


      Future.delayed(Duration(seconds: 5), () {
    
    if (UserSession().availableCache()) {
      var session = UserSession().cache;
      var cache = session.currentUser.accessToken;
      print('cached login controller ${users}');
      UserSession.requestHeaders['Refresh'] = (users.first.requestToken);
      UserSession.requestHeaders['Authorization'] =
      (users.first.accessToken);
      CachedSession().cacheLoaded.value = true;
      retrievedCache.value = true;
      print(UserSession.requestHeaders.toString());
    }
  });
}}
