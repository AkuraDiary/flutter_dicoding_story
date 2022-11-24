import 'dart:io';

import 'package:dicoding_story/data/remote/services/api_service.dart';
import 'package:dicoding_story/pages/add_story/add_story_page.dart';
import 'package:dicoding_story/pages/home/widgets/story_list.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_story/data/local/session/user_sessions.dart';
import 'package:dicoding_story/pages/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/story_model.dart';
import '../../data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? imageFile;
  Future<User?> session = UserSessions.getSession();
  List<Story> storiesData = [];

  @override
  void initState() {
    super.initState();
    //get stories data
    ApiService.getListStory().then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value.message!)));
      setState(() {
        storiesData = value.listStory!;
        debugPrint(storiesData.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<User?>(
          future: session,
          builder: (BuildContext context, AsyncSnapshot<User?> userSession) {
            if (userSession.hasData) {
              return Text("Welcome ${userSession.data!.name!}");
            } else {
              return const Text('Home');
            }
          },
        ),
      ),
      body: StoryList(stories: storiesData),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Upload Story"),
        icon: const Icon(Icons.camera_alt),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) => AlertDialog(
            title: const Text("Upload Story"),
            content: const Text("Choose your story source"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _getFromGallery();
                },
                child: const Text("Gallery"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _getFromCamera();
                },
                child: const Text("Camera"),
              ),
            ],
          ));
          // _getFromCamera();

        },
      ),
    );
  }

  void intoAddStoryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStoryPage(imageFile: imageFile!),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      intoAddStoryPage();
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      intoAddStoryPage();
    }
  }

}
