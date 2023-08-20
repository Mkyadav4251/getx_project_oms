class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});
}

class ProfileModel {
  String name;
  String email;
  String password;
  String phoneNo;
  String gender;

  ProfileModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.gender,
  });
}
