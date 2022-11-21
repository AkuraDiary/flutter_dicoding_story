import 'package:flutter/material.dart';
import 'package:dicoding_story/pages/auth/login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'data/local/session/user_sessions.dart';
import 'data/model/user_model.dart';
import 'pages/home/home.dart';

class MyApp extends StatelessWidget {

  //first check if there is a user logged in
  //if not, redirect to login page

  //if there is a user logged in, show the home page
  //show the user's name and email
  //show a logout button
  //on logout, delete the user session and redirect to login page

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<User?>(
        future: UserSessions.getSession(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          FlutterNativeSplash.remove();
          if (snapshot.hasData) {
            return Home();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}