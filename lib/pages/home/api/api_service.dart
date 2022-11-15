import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internshiptask2/pages/home/api/api_constants.dart';
import 'package:internshiptask2/pages/home/models/daily_exercises.dart';
import 'package:internshiptask2/pages/home/models/goal.dart';

class ApiService {
  bool pageLoaded = true;

  // GET function of Goals

  Future<GoalPage> getGoals({required pageNumber, required pageLimit}) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.goalsEndpoint}?size=$pageLimit&page=$pageNumber");
      var response = await http.get(url, headers: ApiConstants.myHeaders);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        GoalPage page = GoalPage.fromJson(result);
        pageLoaded = false;
        return page;
      }
    } catch (e, s) {
      pageLoaded = true;
      log('$e, $s');
    }
    return GoalPage(results: []);
  }

  // GET function of Goals


  Future<ExercisePage> getExercises(
      {required pageNumber, required pageLimit}) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.exercisesEndpoint}?size=$pageLimit&page=$pageNumber");
      var response = await http.get(url, headers: ApiConstants.myHeaders);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        ExercisePage page = ExercisePage.fromJson(result);
        pageLoaded = false;
        return page;
      }
    } catch (e, s) {
      pageLoaded = true;
      log('$e, $s');
    }
    return ExercisePage(results: []);
  }
}
