import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/Sign_Up.dart';
import 'Screens/splash_Screen.dart';
import 'Share_Preference/shared_preferences_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isLoggedIn = await isUserLoggedIn(); // Check if user is logged in

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      initialRoute: isLoggedIn ? '/home' : '/', // Navigate to home if logged in, else splash screen
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
