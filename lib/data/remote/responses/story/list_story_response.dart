import 'dart:convert';

import '../../../model/story_model.dart';

class ListStoryResponse {
  bool? error;
  String? message;
  List<Story>? listStory;
  List<Story> listStoriesFromJson(String str) =>
       List<Story>.from(json.decode(str).map((x) => Story.fromJson(x)));

  ListStoryResponse({this.error, this.message, this.listStory});

  ListStoryResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['listStory'] != null) {

      listStory = <Story>[];
      json['listStory'].forEach((v) {
        listStory!.add(Story.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error;
    data['message'] = message;
    if (listStory != null) {
      data['listStory'] = listStory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}