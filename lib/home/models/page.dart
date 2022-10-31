import 'package:internshiptask2/home/models/user.dart';

class Page {
  List<User>? data;
  int? total;
  int? page;
  int? limit;

  Page(
      {this.data,
      this.total,
      this.page,
        this.limit});

  static Page fromJson(json){
  List<User> users = (json['data'] as List).map((e) => User.fromJson(e)).toList();
  return Page(
      data: users,
      total: json['total'],
      page: json['page'],
      limit: json['limit']);}
}
