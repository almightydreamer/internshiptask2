import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/daily_exercises.dart';
import '../models/goal.dart';

class HomeController extends GetxController{
RxList<ListItem> items = RxList();
//RxList<DailyExercise> dailyExercises = RxList();

  Future<void> getData() async {
    final String response = await rootBundle.loadString('resources/fitness.json');
    final data = await json.decode(response);
    CarouselItem carouselItem = CarouselItem(goals: (data["goals"] as List).map((e) => Goal.fromJson(e)).toList());
    //ExerciseItem exerciseItem = ExerciseItem(exercises: (data["daily_exercises"] as List).map((e) => Exercise.fromJson(e)).toList());
    items.value = [SectionItem(title: 'Start new Goal'),carouselItem,SectionItem(title: 'Daily task')];
    List<Exercise> exercises = (data["daily_exercises"] as List).map((e) => Exercise.fromJson(e)).toList();
    items.addAll(exercises.map((e) => ExerciseItem(exercise: e)));
   // goals.value = (data["goals"] as List).map((e) => Goal.fromJson(e)).toList();
    //dailyExercises.value = (data["daily_exercises"] as List).map((e) => DailyExercise.fromJson(e)).toList();
  }
}

class ExerciseItem implements ListItem{
  Exercise exercise;

  ExerciseItem({required this.exercise});
}

class CarouselItem implements ListItem {
  List<Goal> goals;

  CarouselItem({required this.goals});
}

class SectionItem implements ListItem{
  String title;

  SectionItem({required this.title});
}



abstract class ListItem {}