import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/home/controllers/home_controller.dart';
import 'package:internshiptask2/home/widgets/daily_list_widgets/daily_task.dart';
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
  void initState() {
    super.initState();
    Get.put(HomeController());
    final HomeController homeController = Get.find();
    homeController.getData();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 50,
        ),
        color: CustomColor.background,
        child: Obx(() => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var item = homeController.items[index];
                if (item is SectionItem) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 16),
                    child: TitleWidget(title: item.title),
                  );
                }
                if (item is CarouselItem) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: GoalsCarouselWidget(
                        goals: item.goals,
                      ));
                }
                if (item is ExerciseItem) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: DailyTaskWidget(exercise: item.exercise));
                }
                return Container();
              },
              itemCount: homeController.items.length,
            )) /*ListView(
            shrinkWrap: true,
            children: [


              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: TitleWidget(title: 'Daily Task'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                      itemCount: homeController.dailyExercises.length,
                      itemBuilder: (context, index) {
                        var item = homeController.dailyExercises[index];
                        return DailyTaskWidget(title: item.title,
                            cover: item.cover,
                            durationSeconds: item.durationSeconds,
                            caloriesCount: item.caloriesCount);
                      }))
              // DailyListWidget(),
            ],
          )*/
        ,
      ),
    );
  }
}
