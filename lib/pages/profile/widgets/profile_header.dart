import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import '../../../models/user_model.dart';
import '../../../util/vectors.dart';
import '../res/custom_colors.dart';
import '../res/text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required this.userProfile}) : super(key: key);

  final UserProfile? userProfile;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: CustomColor.headerBackground,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: (MediaQuery.of(context).size.width) - 48),
              child: SizedBox.square(
                dimension: 24,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Assets.backPage,
                  ),
                ),
              ),
            ),
            ProfilePicture(name: userProfile?.fullName ?? "", radius: 40, fontsize: 30),
            SizedBox(height: 20,),
            Text('@verycoolnickname', style: TextStyles.userNickname),
            SizedBox(height: 5,),
            Text(userProfile?.emailAddress ?? "", style: TextStyles.userEmail),
          ],
        ),
      ),
    );
  }
}
