import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import '../../../../util/vectors.dart';
import '../../res/custom_colors.dart';
import '../../res/text_styles.dart';
import '../terms_page/terms_page.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {

  late CountdownTimerController controller;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: 10);
  }
  @override
  Widget build(BuildContext context) {


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
                      )))),
          Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Text('SMS Code', style: TextStyles.primaryText)),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Please enter your verificatin code from SMS',
                  style: TextStyles.secondaryText)),
          Padding(
              padding: const EdgeInsets.only(top: 28),
              child: TextField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      hintText: 'SMS Code',
                      hintStyle: TextStyles.hintText))),
          Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Center(
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TermsPage()),
                    );
                  },
                  child: Container(
                      color: CustomColor.button,
                      height: 52,
                      child: Center(
                          child: Text('CONFIRM ACCOUNT',
                              style: TextStyles.buttonText))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Center(
                child: RawMaterialButton(
                    onPressed: () {},
                    child: (controller.isRunning)
                        ? (RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'You can get a new code through',
                                  style: TextStyles.bottomTextLeft),
                              TextSpan(
                                  text:
                                      '  ${controller.currentRemainingTime?.min}:${controller.currentRemainingTime?.sec}',
                                  style: TextStyles.bottomTextRight),
                            ],
                          ),
                        ))
                        : (RawMaterialButton(
                            onPressed: () {
                              print(controller.currentRemainingTime);
                            },
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Didn\'t receive code?',
                                      style: TextStyles.bottomTextLeft),
                                  TextSpan(
                                      text: '  Resend',
                                      style: TextStyles.bottomTextRight),
                                ],
                              ),
                            ))))),
          ),
        ]),
      ),
    );
  }
}
