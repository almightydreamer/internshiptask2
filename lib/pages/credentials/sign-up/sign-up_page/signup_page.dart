import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/pages/home/controllers/home_controller.dart';
import '../../res/custom_colors.dart';
import '../../res/text_styles.dart';
import 'package:internshiptask2/util/vectors.dart';

import '../../sign-in/login_page/login_page.dart';
import '../confirmation_page/confirmation_page.dart';
import '../terms_page/terms_page.dart';
import '../../controllers/register_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    final RegisterController registerController = Get.find();
    
    bool notificationStatus = false;
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
                  Navigator.pop(context);
                },
                child: Center(
                  child: Assets.backPage,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text('Sign Up', style: TextStyles.primaryText),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Please enter the required information for sign up',
                  style: TextStyles.secondaryText)),
          Padding(
              padding: const EdgeInsets.only(top: 28),
              child: TextField(
                controller: registerController.fullNameController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    hintText: 'Full Name',
                    hintStyle: TextStyles.hintText),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 28),
              child: TextField(
                controller: registerController.emailController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    hintText: 'Email',
                    hintStyle: TextStyles.hintText),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 28),
              child: TextField(
                controller: registerController.phoneController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    hintText: 'Phone',
                    hintStyle: TextStyles.hintText),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Obx(()=>Stack(
                children: [
                  TextField(
                    controller: registerController.passwordController,
                    obscureText: registerController.obscurePassword.value,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        hintText: 'Password',
                        hintStyle: TextStyles.hintText),
                  ),
                  Positioned(
                      top: 10,
                      bottom: 10,
                      right: 8,
                      child: RawMaterialButton(
                        onPressed: () {
                          registerController.seeButton();
                        },
                        child: Assets.see,
                      ))
                ],
              ))),
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Obx(() => Stack(
                    children: [
                      TextField(
                        controller: registerController.passwordCController,
                        obscureText: registerController.obscurePassword.value,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            hintText: 'Repeat Password',
                            hintStyle: TextStyles.hintText),
                      ),
                      Positioned(
                          top: 10,
                          bottom: 10,
                          right: 8,
                          child: RawMaterialButton(
                            onPressed: () {
                              registerController.seeButton();
                            },
                            child: Assets.see,
                          ))
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  Obx(() => Checkbox(
                      checkColor: CustomColor.checkMarkIcon,
                      activeColor: CustomColor.checkMarkBackground,
                      value: registerController.agreement.value,
                      onChanged: (bool? value) {
                        registerController.agreement.value = value!;
                      })),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text('I agree with', style: TextStyles.bottomTextLeft),
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TermsPage()),
                            );
                          },
                          child: Text('  Terms of Service',
                              style: TextStyles.bottomTextRight),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Center(
                child: RawMaterialButton(
                  onPressed: () {
                    registerController.sendRegistrationData().then((_) {
                      if (registerController.sentData.value) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: Container(
                      color: CustomColor.button,
                      height: 52,
                      child: Center(
                          child: Text('REGISTRATION',
                              style: TextStyles.buttonText))),
                ),
              )),
          Obx(() => Padding(
              padding: const EdgeInsets.only(top: 20),
              child: (!registerController.sentData.value)
                  ? Center(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            registerController.notification.value,
                            style: TextStyles.secondaryText
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    )
                  : Container()))
        ]),
      ),
    );
  }
}
