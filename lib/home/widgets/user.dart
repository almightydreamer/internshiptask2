import 'package:flutter/material.dart';
import 'package:internshiptask2/home/models/user.dart';
import 'package:internshiptask2/home/res/text_styles.dart';
import 'package:internshiptask2/home/widgets/daily_list_widgets/button.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user});

  final User user;

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
                  child: Image.network(user.picture, fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.title} ${user.firstName} ${user.lastName}', style: TextStyles.taskTitle),

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
