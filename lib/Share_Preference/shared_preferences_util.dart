import 'package:shared_preferences/shared_preferences.dart';
import '../User_Modal/Profile_Modal.dart';


Future<void> saveUserProfile(ProfileModel profile) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', profile.name);
  prefs.setString('email', profile.email);
  prefs.setString('password', profile.password);
  prefs.setString('phoneNo', profile.phoneNo);
  prefs.setString('gender', profile.gender);
  prefs.setString('profileImage', profile.profileImage); // Save profile image path
}

Future<ProfileModel?> getUserProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');
  String? phoneNo = prefs.getString('phoneNo');
  String? gender = prefs.getString('gender');
  String? profileImage = prefs.getString('profileImage'); // Retrieve profile image path
  if (name != null && email != null && password != null && phoneNo != null && gender != null && profileImage != null) {
    return ProfileModel(
      name: name,
      email: email,
      password: password,
      phoneNo: phoneNo,
      gender: gender,
      profileImage: profileImage,
    );
  }
  return null;
}

Future<String?> getEmailFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

Future<String?> getPasswordFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('password');
}

Future<bool> isUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

Future<void> setIsUserLoggedIn(bool isLoggedIn) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', isLoggedIn);
}
