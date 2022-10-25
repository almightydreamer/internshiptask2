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
          fillColor: CustomColor.goalStartButtonSecondary,
          highlightColor: CustomColor.goalStartButtonPrimary,
          onPressed: () {},
          child: LayoutBuilder(
              builder: (context, constraints) {
                return Center(child: SizedBox.square(
                    dimension: constraints.maxHeight / 2, child: Vector.start));
              }

          )),
    );
  }
}
