import 'package:flutter/material.dart';
import 'package:internshiptask2/pages/home/models/daily_exercises.dart';
import 'package:internshiptask2/pages/home/res/custom_colors.dart';
import 'package:internshiptask2/pages/home/res/text_styles.dart';
import 'package:internshiptask2/pages/home/widgets/daily_list_widgets/button.dart';
import 'package:internshiptask2/pages/home/widgets/daily_list_widgets/values.dart';
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
                  child: Image.network('https://img.freepik.com/premium-photo/image-planet-outer-space-mixed-media-elements-image-furnished-by-nasa_641298-3434.jpg?w=2000', fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.title, style: TextStyles.taskTitle),
                Row(
                  children: [
                    ValueWidget(
                        icon: Assets.clock,
                        color: CustomColor.timeIndexPrimary,
                        value:
                            '${Duration(seconds: exercise.durationSeconds).inMinutes} min'),
                    const SizedBox(width: 20),
                    ValueWidget(
                        icon: Assets.calories,
                        color: CustomColor.burnIndexPrimary,
                        value: '${exercise.caloriesCount} cal'),
                    ValueWidget(
                        icon: null,
                        color: CustomColor.burnIndexPrimary,
                        value: '${exercise.repetitions} reps')
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
