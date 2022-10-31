import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internshiptask2/home/api/api_constants.dart';
import 'package:internshiptask2/home/models/daily_exercises.dart';
import 'package:internshiptask2/home/models/goal.dart';
import 'package:internshiptask2/home/models/page.dart';

class ApiService {
  bool pageLoaded = true;

  Future<List<Goal>> getGoals() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.goalsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Goal> goals = (jsonDecode(response.body) as List).map((e) => Goal.fromJson(e)).toList();
        return goals;
      }
    } catch (e, s) {
      log('$e, $s');
    }
    return [];
  }

  Future<List<Exercise>> getExercises() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.dailyTasksEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Exercise> exercises = (jsonDecode(response.body) as List).map((e) => Exercise.fromJson(e)).toList();
        return exercises;
      } else {
        return [];
      }
    } catch (e, s) {
      log('$e, $s');
      return [];
    }

  }

  Future<Page> getUsers({required pageNumber, required pageLimit}) async {
    try {
      var url = Uri.parse("${ApiConstants.usersUrl}${ApiConstants.usersEndpoint}?limit=$pageLimit&page=$pageNumber");
      var response = await http.get(url, headers: ApiConstants.myHeaders);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        Page page = Page.fromJson(result);
        pageLoaded = false;
        return page;
      }
    } catch (e, s) {
      pageLoaded = true;
      log('$e, $s');
    }
    return Page(data: []);
  }
}