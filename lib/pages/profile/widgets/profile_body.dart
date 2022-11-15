import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/models/user_model.dart';
import 'package:internshiptask2/pages/profile/widgets/profile_field.dart';

import '../res/text_styles.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.userProfile}) : super(key: key);

  final UserProfile? userProfile;

  @override
  Widget build(BuildContext context) {
    //print('profilebody ${userProfile.fullName}');
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 60, left: 30),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Info',
              style: TextStyles.accountInfo,
            ),
            SizedBox(height: 10),
            ProfileField(
                fieldIcon: Icon(Icons.person),
                fieldName: 'Name',
                fieldValue: userProfile?.fullName ?? "-"),
            ProfileField(
                fieldIcon: Icon(Icons.email),
                fieldName: 'Email',
                fieldValue: userProfile?.emailAddress ?? "-"),
            ProfileField(
                fieldIcon: Icon(Icons.phone),
                fieldName: 'Phone Number',
                fieldValue: (userProfile?.phoneNumber != null &&
                        userProfile!.phoneNumber!.isNotEmpty)
                    ? userProfile!.phoneNumber!
                    : '-'),
          ],
        ),
      ),
    ));
  }
}
