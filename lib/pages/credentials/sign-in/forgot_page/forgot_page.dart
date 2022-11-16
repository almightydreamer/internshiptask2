import 'package:flutter/material.dart';
import 'package:internshiptask2/pages/credentials/sign-in/forgot_page/text_constants.dart';

import '../../../../util/vectors.dart';
import '../../res/custom_colors.dart';
import '../../res/text_styles.dart';
import '../reset_page/reset_page.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: CustomColor.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            )))),
                Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Text('Forgot Password', style: TextStyles.primaryText)),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(Texts.forgotDescription,
                        style: TextStyles.secondaryText)),
                Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            hintText: 'Email',
                            hintStyle: TextStyles.hintText))),
                Padding(
                    padding: const EdgeInsets.only(top: 44),
                    child: Center(
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> const ResetPage()),);
                        },
                        child: Container(
                            color: CustomColor.button,
                            height: 52,
                            child: Center(
                                child: Text('SEND REQUEST',
                                    style: TextStyles.buttonText))),
                      ),
                    )),
              ],
            )));
  }
}
