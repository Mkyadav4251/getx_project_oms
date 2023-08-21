import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10), () {
      Get.offNamed('/login');
    });

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child:Image.network("https://thumbs.dreamstime.com/b/electronic-eshopping-purchase-neon-glow-icon-illustration-light-sign-vector-271243832.jpg",height: double.infinity,),
        ),
      ),
    );
  }
}
