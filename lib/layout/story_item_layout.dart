import 'package:flutter/material.dart';

import '../data/model/story_model.dart';

class StoryItemLayout extends StatelessWidget {
  final Story story;

  const StoryItemLayout({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: 350,
                child: Image.network(
                  story.photoUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(story.name!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
