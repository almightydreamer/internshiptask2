import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'fonts.dart';

class TextStyles {
  static TextStyle poppinsRegular18 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 18);
  static TextStyle poppinsRegular24 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 24);
  static TextStyle poppinsRegular14 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 14);
  static TextStyle poppinsRegular16 = TextStyle(
      fontFamily: Fonts.poppinsRegular, fontSize: 16);


  static TextStyle tabTitle = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 18, color: CustomColor.Tab_Title, fontWeight: FontWeight.w600);
  static TextStyle tabSeeAll = TextStyle(fontFamily: Fonts.poppinsRegular, fontSize: 14, color: CustomColor.Tab_See_All, fontWeight: FontWeight.w600);


}