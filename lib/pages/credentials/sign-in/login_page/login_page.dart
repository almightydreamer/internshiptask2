import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/controllers/user_session_controller.dart';
import 'package:internshiptask2/pages/credentials/api/api_client.dart';
import 'package:internshiptask2/pages/credentials/sign-in/forgot_page/forgot_page.dart';
import 'package:internshiptask2/pages/home/home_page.dart';
import '../../controllers/login_controller.dart';
import '../../res/custom_colors.dart';
import '../../res/text_styles.dart';
import 'package:internshiptask2/util/vectors.dart';

import '../../sign-up/sign-up_page/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final LoginController loginController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: CustomColor.background,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox.square(
              dimension: 24,
              child: RawMaterialButton(
                onPressed: () {
                  print('backpage button');
                },
                child: Center(
                  child: Assets.backPage,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text('Log In', style: TextStyles.primaryText),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 28),
              child: TextField(
                controller: loginController.emailController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    hintText: 'Email',
                    hintStyle: TextStyles.hintText),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Obx(() => Stack(
                    children: [
                      TextField(
                        controller: loginController.passwordController,
                        obscureText: loginController.obscurePassword.value,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            hintText: 'Password',
                            hintStyle: TextStyles.hintText),
                      ),
                      Positioned(
                          top: 10,
                          bottom: 10,
                          right: 8,
                          child: RawMaterialButton(
                            onPressed: () {
                              loginController.seeButton();
                            },
                            child: Assets.see,
                          ))
                    ],
                  ))),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                    child: RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPage()),
                          );
                        },
                        child: Text('Forgot password?',
                            style: TextStyles.midText)))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Center(
                child: RawMaterialButton(
                  onPressed: () async {
                    var res = await loginController.getToken();
                    res.fold((left) {print(left.error);}, (right) {
                      print('log in right');
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    });
                  },
                  child: Container(
                      color: CustomColor.button,
                      height: 52,
                      child: Center(
                          child: Text('LOG IN', style: TextStyles.buttonText))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 44),
            child: Center(
              child: Row(
                children: [
                  Container(
                      color: CustomColor.divisionLine, width: 137, height: 1),
                  const Spacer(),
                  Text('OR', style: TextStyles.divisionLineText),
                  const Spacer(),
                  Container(
                      color: CustomColor.divisionLine, width: 137, height: 1)
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Center(
                child: RawMaterialButton(
                  onPressed: () {
                    print('login with google button');
                  },
                  child: Container(
                      color: CustomColor.logInGoogleButton,
                      height: 44,
                      child: Stack(
                        children: [
                          Center(
                              child: Text('Login with Google',
                                  style: TextStyles.logInGoogleButtonText)),
                          Positioned(
                              left: 16,
                              top: 6,
                              bottom: 6,
                              child: SizedBox.square(
                                  dimension: 32, child: Assets.google))
                        ],
                      )),
                ),
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Center(
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Not registered yet?',
                          style: TextStyles.bottomTextLeft),
                      TextSpan(
                          text: '  Register',
                          style: TextStyles.bottomTextRight),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
