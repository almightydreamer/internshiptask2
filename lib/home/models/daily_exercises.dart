class Exercise {
  final String title;
  final String cover;
  final int caloriesCount;
  final int durationSeconds;

  const Exercise({
    required this.title,
    required this.cover,
    required this.caloriesCount,
    required this.durationSeconds
});

  static Exercise fromJson(json) => Exercise(
      cover: json['cover'],
      title: json['title'],
      caloriesCount: json['calories_count'],
      durationSeconds: json['duration_seconds']
  );
}