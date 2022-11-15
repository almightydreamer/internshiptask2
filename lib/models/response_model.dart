class RegisterDataValueOnSuccess {
  final String? fullName;
  final String? emailAddress;
  final String? phoneNumber;
  final String? profilePicture;

  const RegisterDataValueOnSuccess(
      {required this.fullName,
      required this.emailAddress,
      this.phoneNumber,
      this.profilePicture});

  static RegisterDataValueOnSuccess fromJson(json) =>
      RegisterDataValueOnSuccess(
        fullName: json['full_name'],
        emailAddress: json['email'],
        phoneNumber: json['phone_number'],
        profilePicture: json['profile_picture'],
      );
}

class LoginDataValueOnSuccess {
  final String? refresh;
  final String? access;

  const LoginDataValueOnSuccess({required this.refresh, required this.access});

  static LoginDataValueOnSuccess fromJson(json) => LoginDataValueOnSuccess(
        refresh: json['refresh'],
        access: json['access'],
      );
}



class DataValueOnFailure {
  final dynamic error;

  const DataValueOnFailure(this.error);
}
