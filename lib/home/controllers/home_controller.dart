import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/daily_exercises.dart';
import '../models/goal.dart';

class HomeController extends GetxController{
RxList<Goal> goals = RxList();
RxList<Daily_Exercises> dailyExercises = RxList();

  Future<void> getData() async {
    final String response = await rootBundle.loadString('/lib/home/res/fitness.json');
    final data = await json.decode(response);
    goals = data["goals"];
    dailyExercises = data["daily_exercises"];
  }
}