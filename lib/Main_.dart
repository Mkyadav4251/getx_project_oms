import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/Sign_Up.dart';
import 'Screens/splash_Screen.dart';
import 'Share_Preference/shared_preferences_util.dart';
import 'User_Modal/Profile_Modal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isLoggedIn = await isUserLoggedIn();
  ProfileModel? userProfile;

  if (isLoggedIn) {
    userProfile = await getUserProfile(); // Retrieve user profile data
  }

  runApp(MyApp(isLoggedIn: isLoggedIn, userProfile: userProfile));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final ProfileModel? userProfile;

  MyApp({required this.isLoggedIn, this.userProfile});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      initialRoute: isLoggedIn ? '/home' : '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
