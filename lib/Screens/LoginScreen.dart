import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Share_Preference/shared_preferences_util.dart';



class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    final savedEmail = await getEmailFromSharedPreferences();
                    final savedPassword = await getPasswordFromSharedPreferences();

                    if (email == savedEmail && password == savedPassword) {
                      await setIsUserLoggedIn(true);
                      final profile = await getUserProfile(); // Retrieve profile from SharedPreferences
                      Get.offAllNamed('/home', arguments: profile); // Pass the retrieved profile as arguments
                    }
                    else {
                      Get.snackbar('Login Failed', 'Invalid email or password');
                    }
                  }
                },
                child: Text('Login'),
              ),

              SizedBox(height: 16),
              TextButton(
                onPressed: () {

                  Get.toNamed('/signup');
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
