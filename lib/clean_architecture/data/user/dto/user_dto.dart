class UserAPIDTO {
  final int id;
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const UserAPIDTO(
      {required this.id,
        required this.fullName,
        required this.emailAddress,
        this.phoneNumber,
        this.profilePicture});

  static UserAPIDTO fromJson(json) =>
      UserAPIDTO(
        id: json['id'],
        fullName: json['full_name'],
        emailAddress: json['email'],
        phoneNumber: json['phone_number'],
        profilePicture: json['profile_picture'],
      );
}

class UserLocalDTO {
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const UserLocalDTO(
      {
        required this.fullName,
        required this.emailAddress,
        this.phoneNumber,
        this.profilePicture});

  static UserLocalDTO fromJson(json) =>
      UserLocalDTO(
        fullName: json['full_name'],
        emailAddress: json['email'],
        phoneNumber: json['phone_number'],
        profilePicture: json['profile_picture'],
      );
}