import 'package:flutter/material.dart';
import 'package:internshiptask2/home/res/custom_colors.dart';
import 'package:internshiptask2/util/vectors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
  return SizedBox.square(
    dimension: 40,
      child: RawMaterialButton(
        shape: const CircleBorder(),
          fillColor: CustomColor.startButtonPrimary,
        highlightColor: CustomColor.startButtonSecondary,
        onPressed: (){},
        child: Vector.start


      ),
    );



  }
}
