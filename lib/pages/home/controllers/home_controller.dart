import 'package:get/get.dart';
import '../models/daily_exercises.dart';
import '../models/goal.dart';
import 'package:internshiptask2/pages/home/api/api_service.dart';

class HomeController extends GetxController {
  RxList<ListItem> items = RxList();
  int pageNumber = 0;
  int pageLimit = 10;
  RxBool loading = false.obs;
  RxBool pageLoaded = false.obs;
  RxBool allLoaded = false.obs;
  List<ExerciseItem> exerciseItems = [];
var carouselItem;

  Future<void> getGoals() async {
    //await Future.delayed(const Duration(seconds: 2));

    GoalPage? goalPage =
        await ApiService().getGoals(pageNumber: 1, pageLimit: pageLimit);
    if (goalPage.results != null) {
      carouselItem = CarouselItem(goals: goalPage.results!);
    }

  }

  void getExercises() async {
    loading.value = true;

   // await Future.delayed(const Duration(seconds: 2));

    ExercisePage? page = await ApiService()
        .getExercises(pageNumber: pageNumber, pageLimit: pageLimit);
    if (page.results != null) {
      exerciseItems =
          page.results!.map((el) => ExerciseItem(exercise: el)).toList();
      pageNumber++;
    }
    if (exerciseItems.isNotEmpty) {
      items.addAll(exerciseItems);
    }
    loading.value = false;
    allLoaded.value = exerciseItems.isEmpty;
  }

  Future<void> getData() async {
    // List<Goal> goals = await ApiService().getGoals();
    // CarouselItem carouselItem = CarouselItem(goals: goals);

    await getGoals();

    items.value = [
      SectionItem(title: 'Start new Goal'),
      carouselItem,
      SectionItem(title: 'Users'),
    ];
    getExercises();
  }
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
