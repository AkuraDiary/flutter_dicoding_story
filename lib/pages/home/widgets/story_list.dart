import 'package:dicoding_story/pages/detail/detail.dart';
import 'package:flutter/material.dart';

import '../../../data/model/story_model.dart';
import '../../../layout/story_item_layout.dart';

class StoryList extends StatelessWidget {
  final List<Story> stories;

  const StoryList({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return stories.isNotEmpty? GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 1,
      mainAxisSpacing: 2,
      children: stories.map(
        (story) {
          return InkWell(
            child: StoryItemLayout(story: story),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(story: story),
                ),
              );
            },
          );
        },
      ).toList(),
    ) : const Text(":/ no stories");
  }
}
