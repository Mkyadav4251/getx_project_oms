import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../User_Modal/Profile_Modal.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileModel profile = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: profile.profileImage.isNotEmpty
                  ? FileImage(File(profile.profileImage))
                  : AssetImage('assets/default_profile.jpg') as ImageProvider<Object>,
            ),
            SizedBox(height: 16),
            Text('Name: ${profile.name}'),
            Text('Phone: ${profile.phoneNo}'),
            Text('Password: ${profile.password}'),
            Text('email: ${profile.email}'),
            Text('gender: ${profile.gender}'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child:  Container(
                decoration: BoxDecoration(

                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: profile.profileImage.isNotEmpty
                        ? FileImage(File(profile.profileImage))
                        : AssetImage("")as ImageProvider<Object>,
                  ),
                ),
              )

            ),
            ListTile(
              title:Text('Name: ${profile.name}'),

            ),
            ListTile(
              title: Text('Phone: ${profile.phoneNo}'),

            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
