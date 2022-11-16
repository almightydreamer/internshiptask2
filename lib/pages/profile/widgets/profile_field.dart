import 'package:flutter/material.dart';

import '../res/text_styles.dart';

class ProfileField extends StatelessWidget {
  const ProfileField(
      {Key? key,
      required this.fieldIcon,
      required this.fieldName,
      required this.fieldValue})
      : super(key: key);

  final Icon fieldIcon;
  final String fieldName;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        child: Row(children: [
          fieldIcon,
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(fieldName, style: TextStyles.accountField,), Text(fieldValue, style: TextStyles.accountFieldValue,)],
          )
        ]),
      ),
    );
  }
}
