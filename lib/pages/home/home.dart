
import 'package:flutter/material.dart';
import 'package:dicoding_story/data/local/session/user_sessions.dart';
import 'package:dicoding_story/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_model.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Future<User?> session = UserSessions.getSession();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Home'),
            // get saved user login email
            FutureBuilder<User?>(
              future: session,
              builder: (BuildContext context,
                  AsyncSnapshot<User?> userSession) {
                if (userSession.hasData) {
                  return Text(userSession.data!.name!);
                } else {
                  return Text('No data');
                }
              },
            ),

            // logout button
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
