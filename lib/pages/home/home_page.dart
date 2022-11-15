import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:internshiptask2/controllers/user_session_controller.dart';
import 'package:internshiptask2/pages/credentials/sign-in/login_page/login_page.dart';
import 'package:internshiptask2/pages/home/controllers/home_controller.dart';
import 'package:internshiptask2/pages/home/res/text_styles.dart';
import 'package:internshiptask2/pages/home/widgets/daily_list_widgets/daily_task.dart';
import 'package:internshiptask2/pages/home/widgets/goals_carousel.dart';
import 'package:internshiptask2/models/user_model.dart';
import '../credentials/api/api_client.dart';
import '../credentials/controllers/login_controller.dart';
import '../profile/profile_page.dart';
import 'res/custom_colors.dart';
import 'widgets/titles.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

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
    homeController.getExercises();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !homeController.loading.value &&
          !homeController.allLoaded.value) {
        homeController.getExercises();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Fit Assist', style: TextStyles.appBarTitle),
          backgroundColor: CustomColor.appBarBackground,
          toolbarHeight: 70,
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: CustomColor.appBarBackground),
              child: Center(
                child: Container(
                  child: Obx(()=>Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: ProfilePicture(
                              name: LoginController().userProfile.value.fullName ?? "",
                              radius: 42,
                              fontsize: 40)),
                      Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                              'Hello ${LoginController().userProfile.value.fullName ?? ""}')),
                    ],
                  )),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('My Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                }),
            ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                  print('notificatoins');
                }),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  print('settings');
                }),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  UserSession().signOut();
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                }),
          ],
        )),
        body: Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 20,
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
        ));
  }
}
