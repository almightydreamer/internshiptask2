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
    cover: json['cover'],
    title: json['title'],
    subTitle: json['sub_title'],
    caloriesCount: json['calories_count'],
    durationSeconds: json['duration_seconds']
  );
}