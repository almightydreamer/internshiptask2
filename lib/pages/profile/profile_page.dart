import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/controllers/user_session_controller.dart';
import 'package:internshiptask2/models/user_model.dart';
import 'package:internshiptask2/pages/profile/edit_profile_page.dart';
import 'package:internshiptask2/pages/profile/res/custom_colors.dart';
import 'package:internshiptask2/pages/profile/res/text_styles.dart';
import 'widgets/profile_header.dart';

import 'widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProfile? userProfile = UserSession().userProfile;
    UserSession().updateCache();
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileHeader(
                userProfile: userProfile,
              ),
              ProfileBody(
                userProfile: userProfile,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 265),
            child: Align(
              alignment: Alignment.topCenter,
              child: RawMaterialButton(
                onPressed: () {
                  UserSession().updateCache();
                  print('profilepagesession ${UserSession().cache.currentUser.fullName.toString()}');
                  print('profilepagesession ${UserSession().cache.currentUser.accessToken.toString()}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                  );
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                          color: CustomColor.headerBackground, width: 7),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: CustomColor.headerBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.manage_accounts,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Text(
                          'Edit Profile',
                          style: TextStyles.editProfile,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
