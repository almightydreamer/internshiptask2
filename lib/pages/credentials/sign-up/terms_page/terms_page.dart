import 'package:flutter/material.dart';
import '../../res/custom_colors.dart';
import '../../res/text_styles.dart';
import 'package:internshiptask2/util/vectors.dart';
import 'package:internshiptask2/pages/credentials/sign-up/terms_page/text_constants.dart';


class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28),
                      child: Text('Terms of Services',
                          style: TextStyles.primaryText),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 28),
                      child: Text(Texts.terms, style: TextStyles.secondaryText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
