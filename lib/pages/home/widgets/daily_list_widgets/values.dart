import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internshiptask2/pages/home/res/text_styles.dart';


class ValueWidget extends StatelessWidget {
  const ValueWidget(
      {super.key, this.icon, required this.color, required this.value});

  final SvgPicture? icon;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          icon ?? const SizedBox(width: 5, height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child:
                Text(value, style: TextStyles.taskValue.copyWith(color: color)),
          )
        ],
      ),
    );
  }
}
