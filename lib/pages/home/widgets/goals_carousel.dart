import 'package:flutter/material.dart';
import 'package:internshiptask2/pages/home/widgets/goals_carousel_widgets/goal.dart';
import '../models/goal.dart';

class GoalsCarouselWidget extends StatefulWidget {
  const GoalsCarouselWidget({super.key, required this.goals});

  final List<Goal> goals;

  @override
  State<GoalsCarouselWidget> createState() {
    return GoalsCarouselWidgetState();
  }
}

class GoalsCarouselWidgetState extends State<GoalsCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 276,
        child: PageView.builder(
          allowImplicitScrolling: true,
          physics: const PageScrollPhysics(parent: BouncingScrollPhysics()) ,
          controller: PageController(viewportFraction: 0.8),
          pageSnapping: true,
          padEnds: false,
          itemCount: widget.goals.length,
          itemBuilder: (context, index) {
            var item = widget.goals[index];
            return GoalWidget(
                cover: 'https://img.freepik.com/premium-photo/image-planet-outer-space-mixed-media-elements-image-furnished-by-nasa_641298-3434.jpg?w=2000',
                durationSeconds: item.durationSeconds,
                caloriesCount: item.caloriesCount,
                goalTitle: item.title,
                goalDescription: item.subTitle);
          },
        ),

    );
    // return Obx(()=>Text(homeController.goals.toString()));
    //return SizedBox(height: 144, child: Column(children: [Image.asset('name')],),);
  }
}
