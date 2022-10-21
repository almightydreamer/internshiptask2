class DailyExercises {
  final String title;
  final String cover;
  final int caloriesCount;
  final int durationSeconds;

  const DailyExercises({
    required this.title,
    required this.cover,
    required this.caloriesCount,
    required this.durationSeconds
});

  static DailyExercises fromJson(json) => DailyExercises(
      cover: json['cover'],
      title: json['title'],
      caloriesCount: json['calories_count'],
      durationSeconds: json['duration_seconds']
  );
}