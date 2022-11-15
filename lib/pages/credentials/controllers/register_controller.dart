import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/models/user_model.dart';

import '../api/api_client.dart';

class RegisterController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCController = TextEditingController();

  RxBool agreement = false.obs;
  RxBool sentData = true.obs;
  RxString notification = ''.obs;

  RxBool obscurePassword = true.obs;

  void seeButton() {
    obscurePassword.value = !obscurePassword.value;
  }

  bool passwordMatch() {
    // check if passwords match

    if (passwordController.text == passwordCController.text) {
      return true;
    } else {
      return false;
    }
  }

  bool dataIsFine() {
    // check if all Text Fields are completed

    return (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordMatch() &&
        agreement.value);
  }

  void markError() {}

  Future<void> sendRegistrationData() async {
    if (dataIsFine()) {
      var userData = <String, String>{
        'full_name': fullNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone_number': phoneController.text
      };
      print('nice data');

      var response = await ApiClient().registerUser(userData);
      response.fold((left) {
        print(left.error.toString());
        notification.value = (left.error.toString());
        sentData.value = false;
      }, (right) {
        sentData.value = true;
        print(right.toString());
      });

      fullNameController.clear();
      emailController.clear();
      phoneController.clear();
      passwordController.clear();
      passwordCController.clear();

      // ApiClient().registerUser(userData);

    } else {
      markError();
    }
  }
}
