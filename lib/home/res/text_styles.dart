import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'package:internshiptask2/util/fonts.dart';

class TextStyles {
  static TextStyle poppinsRegular18 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 18);
  static TextStyle poppinsRegular24 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 24);
  static TextStyle poppinsRegular14 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 14);
  static TextStyle poppinsRegular16 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 16);


  static TextStyle tabTitle = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 18, color: CustomColor.tabTitle, fontWeight: FontWeight.w600);
  static TextStyle tabSeeAll = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 14, color: CustomColor.tabSeeAll, fontWeight: FontWeight.w600);
  static TextStyle goalTitle = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 24, color: CustomColor.goalTitle, fontWeight: FontWeight.w600);
  static TextStyle goalDescription = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 14, color: CustomColor.goalDescription, fontWeight: FontWeight.w500);
  static TextStyle goalValue = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 14, fontWeight: FontWeight.w500);


}