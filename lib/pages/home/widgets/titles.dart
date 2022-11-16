import 'package:flutter/material.dart';

import '../res/text_styles.dart';


class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          Text(title, style: TextStyles.tabTitle),
          Text('See all', style: TextStyles.tabSeeAll)
        ],
      ),
    );
  }
}
