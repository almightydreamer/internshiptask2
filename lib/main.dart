import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/controllers/home_controller.dart';
import 'home/home_page.dart';
import 'home/res/custom_colors.dart';
import 'home/widgets/titles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
