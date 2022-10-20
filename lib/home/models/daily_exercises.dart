class Daily_Exercises {
  final String title;
  final String cover;
  final int caloriesCount;
  final int durationSeconds;

  const Daily_Exercises({
    required this.title,
    required this.cover,
    required this.caloriesCount,
    required this.durationSeconds
});

  static Daily_Exercises fromJson(json) => Daily_Exercises(
      cover: json['cover'],
      title: json['title'],
      caloriesCount: json['calories_count'],
      durationSeconds: json['duration_seconds']
  );
}