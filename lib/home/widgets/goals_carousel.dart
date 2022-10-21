import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/home/widgets/goals_carousel_widgets/goal.dart';
import '../controllers/home_controller.dart';
import '../models/goal.dart';

class GoalsCarouselWidget extends StatefulWidget {
  const GoalsCarouselWidget({super.key});

  @override
  State<GoalsCarouselWidget> createState() {
    return GoalsCarouselWidgetState();
  }
}

class GoalsCarouselWidgetState extends State<GoalsCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Obx(
      () => Container(
        height: 276,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          pageSnapping: false,
          itemCount: homeController.goals.length,
          itemBuilder: (context, index) {
            var item = homeController.goals[index];
            return GoalWidget(
                cover: item.cover,
                durationSeconds: item.durationSeconds,
                caloriesCount: item.caloriesCount,
                goalTitle: item.title,
                goalDescription: item.subTitle);
          },
        ),
      ),
    );
    // return Obx(()=>Text(homeController.goals.toString()));
    //return SizedBox(height: 144, child: Column(children: [Image.asset('name')],),);
  }
}
