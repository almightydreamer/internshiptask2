import 'package:flutter/material.dart';
import 'package:internshiptask2/home/models/daily_exercises.dart';
import 'package:internshiptask2/home/res/custom_colors.dart';
import 'package:internshiptask2/home/res/text_styles.dart';
import 'package:internshiptask2/home/widgets/daily_list_widgets/button.dart';
import 'package:internshiptask2/home/widgets/daily_list_widgets/values.dart';
import 'package:internshiptask2/util/vectors.dart';

class DailyTaskWidget extends StatelessWidget {
  const DailyTaskWidget({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.square(
                  dimension: 48,
                  child: Image.network(exercise.cover, fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.title, style: TextStyles.taskTitle),
                Row(
                  children: [
                    ValueWidget(
                        icon: Vector.clock,
                        color: CustomColor.timeIndexPrimary,
                        value:
                            '${Duration(seconds: exercise.durationSeconds).inMinutes} min'),
                    const SizedBox(width: 20),
                    ValueWidget(
                        icon: Vector.calories,
                        color: CustomColor.burnIndexPrimary,
                        value: '${exercise.caloriesCount} cal')
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ButtonWidget(),
          )
        ],
      ),
    );
  }
}
