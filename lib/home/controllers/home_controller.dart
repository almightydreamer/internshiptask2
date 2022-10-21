import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/daily_exercises.dart';
import '../models/goal.dart';

class HomeController extends GetxController{
RxList<Goal> goals = RxList();
RxList<DailyExercises> dailyExercises = RxList();

  Future<void> getData() async {
    final String response = await rootBundle.loadString('resources/fitness.json');
    final data = await json.decode(response);
    goals.value = (data["goals"] as List).map((e) => Goal.fromJson(e)).toList();
    dailyExercises.value = (data["daily_exercises"] as List).map((e) => DailyExercises.fromJson(e)).toList();
  }
}