import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'package:internshiptask2/util/fonts.dart';

class TextStyles {

  static TextStyle primaryText = TextStyle(
      fontFamily: Fonts.poppinsRegular,
      fontSize: 26,
      color: CustomColor.primaryText,
      fontWeight: FontWeight.w700);

  static TextStyle secondaryText = TextStyle(
      fontFamily: Fonts.poppinsRegular,
      fontSize: 14,
      color: CustomColor.secondaryText,
      fontWeight: FontWeight.w400);

  static TextStyle hintText = TextStyle(
      fontFamily: Fonts.interRegular,
      fontSize: 14,
      color: CustomColor.insertHint,
      fontWeight: FontWeight.w400);

  static TextStyle midText = TextStyle(
      fontFamily: Fonts.poppinsRegular,
      fontSize: 14,
      color: CustomColor.midText,
      fontWeight: FontWeight.w600);

  static TextStyle bottomTextLeft = TextStyle(
      fontFamily: Fonts.interRegular,
      fontSize: 14,
      color: CustomColor.bottomTextLeft,
      fontWeight: FontWeight.w600);

  static TextStyle bottomTextRight = TextStyle(
      fontFamily: Fonts.interRegular,
      fontSize: 14,
      color: CustomColor.bottomTextRight,
      fontWeight: FontWeight.w600);

  static TextStyle buttonText = TextStyle(
      fontFamily: Fonts.poppinsRegular,
      fontSize: 14,
      color: CustomColor.buttonText,
      fontWeight: FontWeight.w400);

  static TextStyle divisionLineText = TextStyle(
      fontFamily: Fonts.interRegular,
      fontSize: 14,
      color: CustomColor.divisionLineText,
      fontWeight: FontWeight.w400);

  static TextStyle logInGoogleButtonText = TextStyle(
      fontFamily: Fonts.interRegular,
      fontSize: 14,
      color: CustomColor.logInGoogleButtonText,
      fontWeight: FontWeight.w400);

}
