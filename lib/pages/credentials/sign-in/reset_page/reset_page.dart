import 'package:flutter/material.dart';
import 'package:internshiptask2/pages/credentials/sign-in/reset_page/text_constants.dart';

import '../../../../util/vectors.dart';
import '../../res/custom_colors.dart';
import '../../res/text_styles.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

bool obscurePassword = true;

class _ResetPageState extends State<ResetPage> {
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
                    child: Text('Reset Password', style: TextStyles.primaryText)),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(Texts.resetDescription,
                        style: TextStyles.secondaryText)),
                Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Stack(
                      children: [
                        TextField(
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4))),
                              hintText: 'Password',
                              hintStyle: TextStyles.hintText),
                        ),
                        Positioned(
                            top: 10, bottom: 10, right: 8,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              child: Assets.see,
                            ))
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Stack(
                      children: [
                        TextField(
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4))),
                              hintText: 'Repeat Password',
                              hintStyle: TextStyles.hintText),
                        ),
                        Positioned(
                            top: 10, bottom: 10, right: 8,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              child: Assets.see,
                            ))
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 44),
                    child: Center(
                      child: RawMaterialButton(
                        onPressed: () {
                          print('submit changes button');
                        },
                        child: Container(
                            color: CustomColor.button,
                            height: 52,
                            child: Center(
                                child: Text('SUBMIT CHANGES',
                                    style: TextStyles.buttonText))),
                      ),
                    )),
              ],
            )));
  }
}
