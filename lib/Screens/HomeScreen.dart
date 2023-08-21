import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../User_Modal/Profile_Modal.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileModel? profile = Get.arguments as ProfileModel?;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: profile?.profileImage.isNotEmpty ?? false
                  ? FileImage(File(profile!.profileImage))
                  : AssetImage('assets/images/Login.png') as ImageProvider<Object>,
            ),
            SizedBox(height: 16),
            Text('Name: ${profile?.name ?? ''}'),
            Text('Phone: ${profile?.phoneNo ?? ''}'),
            Text('Password: ${profile?.password ?? ''}'),
            Text('Email: ${profile?.email ?? ''}'),
            Text('Gender: ${profile?.gender ?? ''}'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: profile?.profileImage.isNotEmpty ?? false
                        ? FileImage(File(profile!.profileImage))
                        : AssetImage('assets/images/Login.png') as ImageProvider<Object>,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Name: ${profile?.name ?? ''}'),
            ),
            ListTile(
              title: Text('Phone: ${profile?.phoneNo ?? ''}'),
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
