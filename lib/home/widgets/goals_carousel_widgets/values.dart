import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internshiptask2/home/res/text_styles.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget(
      {super.key,
      required this.icon,
      required this.primaryColor,
      required this.secondaryColor,
      required this.value});

  final SvgPicture icon;
  final Color primaryColor;
  final Color secondaryColor;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            decoration: BoxDecoration(
                color: secondaryColor,
                border: (Border.all(color: primaryColor)),
                borderRadius: BorderRadius.circular(16)),
            child: Row(children: [Padding(
              padding: const EdgeInsets.only(left:5, top: 5,bottom: 5),
              child: icon,
            ), Padding(
              padding: const EdgeInsets.only(left:6, right:8),
              child: Text(value,style: TextStyles.goalValue.copyWith(color: primaryColor)),
            )])));
  }
}
