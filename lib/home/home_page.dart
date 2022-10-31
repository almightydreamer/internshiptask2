import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/home/controllers/home_controller.dart';
import 'package:internshiptask2/home/res/text_styles.dart';
import 'package:internshiptask2/home/widgets/daily_list_widgets/daily_task.dart';
import 'package:internshiptask2/home/widgets/goals_carousel.dart';
import 'package:internshiptask2/home/widgets/user.dart';
import 'res/custom_colors.dart';
import 'widgets/titles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    final HomeController homeController = Get.find();
    homeController.getData();
    homeController.fetchPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !homeController.loading.value &&
          !homeController.allLoaded.value) {
        homeController.fetchPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      body: SliderDrawer(
          key: _key,
          appBar: SliderAppBar(
            title: Text('Fit Assist', style: TextStyles.appBarTitle),
            appBarColor: CustomColor.appBarBackground,
            appBarHeight: 100,
            drawerIconColor: Colors.white,
          ),
          slider: Container(
            color: CustomColor.sliderBackground,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              top: 5,
            ),
            color: CustomColor.background,
            child: Obx(
              () => ListView(
                controller: _scrollController,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                      if (item is UserItem) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            child: UserWidget(user: item.user));
                      }

                      return Container();
                    },
                    itemCount: homeController.items.length,
                  ),
                  if (homeController.loading.value) ...[
                    const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(child: CircularProgressIndicator()))
                  ],
                ],
              ),
            ),
          )),
    );
  }
}
