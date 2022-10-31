import 'package:get/get.dart';
import 'package:internshiptask2/home/models/user.dart';
import 'package:internshiptask2/home/models/page.dart';
import '../models/daily_exercises.dart';
import '../models/goal.dart';
import 'package:internshiptask2/home/api/api_service.dart';

class HomeController extends GetxController {
  RxList<ListItem> items = RxList();
  int pageNumber = 1;
  int pageLimit = 10;
  List<UserItem> userItems = [];
  RxBool loading = false.obs;
  RxBool pageLoaded = false.obs;
  RxBool allLoaded = false.obs;

  void fetchPage() async {
    if (pageLoaded.value) {
      return;
    }

    loading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    Page? page = await ApiService()
        .getUsers(pageNumber: pageNumber, pageLimit: pageLimit);
    if (page.data != null) {
      userItems = page.data!.map((el) => UserItem(user: el)).toList();
      pageNumber++;
    }
    if (userItems.isNotEmpty) {
      items.addAll(userItems);
    }
    loading.value = false;
    allLoaded = userItems.isEmpty.obs;
  }

  Future<void> getData() async {
    List<Goal> goals = await ApiService().getGoals();
    CarouselItem carouselItem = CarouselItem(goals: goals);

    items.value = [
      SectionItem(title: 'Start new Goal'),
      carouselItem,
      SectionItem(title: 'Users'),
    ];

    Page? page = await ApiService()
        .getUsers(pageNumber: pageNumber, pageLimit: pageLimit);
    if (page.data != null) {
      userItems = page.data!.map((el) => UserItem(user: el)).toList();
      pageNumber++;
    }
    items.addAll(userItems);
  }
}

class UserItem implements ListItem {
  User user;

  UserItem({required this.user});
}

class ExerciseItem implements ListItem {
  Exercise exercise;

  ExerciseItem({required this.exercise});
}

class CarouselItem implements ListItem {
  List<Goal> goals;

  CarouselItem({required this.goals});
}

class SectionItem implements ListItem {
  String title;

  SectionItem({required this.title});
}

abstract class ListItem {}
