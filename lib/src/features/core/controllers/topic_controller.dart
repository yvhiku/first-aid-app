// topic_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/all_topic.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/bleeding.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/burns.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/choking.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/cpr.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/poisons.dart';

class TopicController extends GetxController {
  final savedTopics = <Map<String, dynamic>>[].obs;

  // Add a topic to saved list with proper screen reference
  void addTopic(Map<String, dynamic> topic) {
    if (!isTopicSaved(topic)) {
      // Ensure the topic has a type identifier
      final savedTopic = {
        'title': topic['title'],
        'image': topic['image'],
        'screen': topic['screen'],
        'type': topic['type'], // Add this to your topic data when creating
      };
      savedTopics.add(savedTopic);
    }
  }

  void removeTopic(Map<String, dynamic> topic) {
    savedTopics.removeWhere((t) => t['title'] == topic['title']);
  }

  bool isTopicSaved(Map<String, dynamic> topic) {
    return savedTopics.any((t) => t['title'] == topic['title']);
  }

  void toggleTopicSave(Map<String, dynamic> topic) {
    if (isTopicSaved(topic)) {
      removeTopic(topic);
    } else {
      addTopic(topic);
    }
  }

  // Helper method to get the appropriate screen based on topic type
  Widget getScreenForTopic(Map<String, dynamic> topic) {
    switch (topic['type']) {
      case 'cpr':
        return CprScreen();
      case 'bleeding':
        return Bleeding();
      case 'burns':
        return BurnScreen();
      case 'choking':
        return ChokingScreen();
      case 'poisons':
        return PoisonScreen();
      default:
        return AllTopicsScreen();
    }
  }
}
