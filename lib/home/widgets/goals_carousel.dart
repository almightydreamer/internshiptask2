import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/goal.dart';

class GoalsCarouselWidget extends StatefulWidget {
  const GoalsCarouselWidget({Key? key}) : super(key: key);


  @override
  State<GoalsCarouselWidget> createState() {
    return GoalsCarouselWidgetState();
  }
}

class GoalsCarouselWidgetState extends State<GoalsCarouselWidget> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    final HomeController homeController = Get.find();
    homeController.getData();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Text(homeController.goals.toString());
    //return SizedBox(height: 144, child: Column(children: [Image.asset('name')],),);
  }
}
