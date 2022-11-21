
import 'package:dicoding_story/data/remote/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_story/data/local/session/user_sessions.dart';
import 'package:dicoding_story/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/story_model.dart';
import '../../data/model/user_model.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  Future<User?> session = UserSessions.getSession();
  List<Story> storiesData= [];

  @override
  void initState() {

    super.initState();
    //get stories data
    ApiService.getListStory().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.message!)));
      setState(() {
        storiesData = value.listStory!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<User?>(
          future: session,
          builder: (BuildContext context,
              AsyncSnapshot<User?> userSession) {
            if (userSession.hasData) {
              return Text("Welcome ${userSession.data!.name!}");
            } else {
              return Text('Home');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Home'),
            //show the story list
            Expanded(
              child: ListView.builder(
                itemCount: storiesData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(storiesData[index].name!),
                    subtitle: Text(storiesData[index].description!),
                  );
                },
              ),
            ),

            // logout button
            ElevatedButton(
                onPressed: () {
                  UserSessions.deleteSession();
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
