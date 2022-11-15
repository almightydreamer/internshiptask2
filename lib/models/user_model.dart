class UserRegister {
  final String fullName;
  final String emailAddress;
  final String password;
  final String? phoneNumber;
  final String? profilePicture;

  const UserRegister(
      {required this.fullName,
      required this.emailAddress,
      required this.password,
      this.phoneNumber,
      this.profilePicture});

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'email': emailAddress,
        'password': password,
        'phone_number': phoneNumber,
        'profile_picture': profilePicture
      };
}

class UserLogin {
  final String emailAddress;
  final String password;

  const UserLogin({required this.emailAddress, required this.password});

  Map<String, dynamic> toJson() => {
        'email': emailAddress,
        'password': password,
      };
}

class UserProfile {
  final int id;
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const UserProfile(
      {required this.id,
        required this.fullName,
        required this.emailAddress,
        this.phoneNumber,
        this.profilePicture});

  static UserProfile fromJson(json) =>
      UserProfile(
        id: json['id'],
        fullName: json['full_name'],
        emailAddress: json['email'],
        phoneNumber: json['phone_number'],
        profilePicture: json['profile_picture'],
      );
}

class CurrentUser {
  final String accessToken;
  final String requestToken;
  final String fullName;
  final String emailAddress;
  final String? phoneNumber;

  const CurrentUser({
    required this.accessToken,
    required this.requestToken,
    required this.fullName,
    required this.emailAddress,
    this.phoneNumber
  });
}
