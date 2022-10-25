import 'package:flutter/material.dart';
import 'package:internshiptask2/home/res/custom_colors.dart';
import 'package:internshiptask2/home/res/text_styles.dart';
import 'package:internshiptask2/home/widgets/goals_carousel_widgets/button.dart';
import '../../../util/vectors.dart';
import 'package:internshiptask2/home/widgets/goals_carousel_widgets/values.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget(
      {super.key,
      required this.cover,
      required this.durationSeconds,
      required this.caloriesCount,
      required this.goalTitle,
      required this.goalDescription});

  final String goalTitle;
  final String goalDescription;
  final String cover;
  final int durationSeconds;
  final int caloriesCount;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: CustomColor.tabBackground,
                borderRadius: const BorderRadius.all(Radius.circular(24))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  height: 144,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(cover, fit: BoxFit.cover))),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(goalTitle, style: TextStyles.goalTitle),
                    Text(goalDescription, style: TextStyles.goalDescription),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
                child: Row(children: [
                  ValueWidget(
                      icon: Vector.clock,
                      primaryColor: CustomColor.timeIndexPrimary,
                      secondaryColor: CustomColor.timeIndexSecondary,
                      value: '${Duration(seconds: durationSeconds).inMinutes} min'),
                  const SizedBox(width:16),
                  ValueWidget(
                      icon: Vector.calories,
                      primaryColor: CustomColor.burnIndexPrimary,
                      secondaryColor: CustomColor.burnIndexSecondary,
                      value: '$caloriesCount cal')
                ]),
              )
            ])),
        const Positioned(
          top: 0,
          right: 0,
          child: Padding(
              padding: EdgeInsets.only(top: 124, right: 24),
              child: ButtonWidget()),
        ),
      ],
    );
  }
}
