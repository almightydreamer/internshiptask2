class GoalPage {
  List<Goal>? results;
  int? count;
  String? previous;
  String? next;

  GoalPage(
      {this.results,
        this.next,
        this.previous,
        this.count});

  static GoalPage fromJson(json){
    List<Goal> goals = (json['results'] as List).map((e) => Goal.fromJson(e)).toList();
    return GoalPage(
        results: goals,
        next: json['next'],
        previous: json['previous'],
        count: json['count']);}
}

class Goal {
  final String cover;
  final String title;
  final String subTitle;
  final int caloriesCount;
  final int durationSeconds;

  const Goal({
    required this.cover,
    required this.title,
    required this.subTitle,
    required this.caloriesCount,
    required this.durationSeconds
  });

  static Goal fromJson(json) => Goal(
      cover: json['image'],
      title: json['title'],
      subTitle: json['description'],
      caloriesCount: json['burn_calories'],
      durationSeconds: json['duration']
  );
}
