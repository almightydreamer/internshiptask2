class User {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;

  const User(
      {required this.id,
      required this.title,
      required this.firstName,
      required this.lastName,
      required this.picture});

  static User fromJson(json) => User(
      id: json['id'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      picture: json['picture']);
}
