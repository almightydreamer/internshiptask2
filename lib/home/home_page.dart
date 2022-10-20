import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/home/controllers/home_controller.dart';
import 'package:internshiptask2/home/widgets/goals_carousel.dart';
import 'res/custom_colors.dart';
import 'widgets/titles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 16, top: 63, right: 16),
          color: CustomColor.Background,
          child: Column(children: const [
            TitleWidget(title: 'Start New Goal'),

            GoalsCarouselWidget(),
            TitleWidget(title: 'Daily Task'),
            //TasksListWidget,
          ],)),
    );
  }

}
