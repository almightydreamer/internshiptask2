class ExercisePage {
  List<Exercise>? results;
  int? count;
  String? next;
  String? previous;

  ExercisePage({this.results, this.count, this.next, this.previous});

  static ExercisePage fromJson(json) {
    List<Exercise> exercises =
        (json['results'] as List).map((e) => Exercise.fromJson(e)).toList();
    return ExercisePage(
        results: exercises,
        count: json['count'],
        next: json['next'],
        previous: json['previous']);
  }
}

class Exercise {
  final String title;
  final String cover;
  final int caloriesCount;
  final int durationSeconds;
  final int repetitions;

  const Exercise(
      {required this.title,
      required this.cover,
      required this.caloriesCount,
      required this.durationSeconds,
      required this.repetitions});

  static Exercise fromJson(json) => Exercise(
      cover: json['image'],
      title: json['title'],
      caloriesCount: json['burn_calories'],
      durationSeconds: json['duration'],
      repetitions: json['repetitions']);
}
