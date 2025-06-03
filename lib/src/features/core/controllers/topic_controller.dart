// topic_controller.dart
import 'package:get/get.dart';

class TopicController extends GetxController {
  // List to hold saved topics
  final savedTopics = <Map<String, dynamic>>[].obs;

  // Add a topic to saved list
  void addTopic(Map<String, dynamic> topic) {
    if (!isTopicSaved(topic)) {
      savedTopics.add(topic);
    }
  }

  // Remove a topic from saved list
  void removeTopic(Map<String, dynamic> topic) {
    savedTopics.removeWhere((t) => t['title'] == topic['title']);
  }

  // Check if a topic is already saved
  bool isTopicSaved(Map<String, dynamic> topic) {
    return savedTopics.any((t) => t['title'] == topic['title']);
  }

  // Toggle save status of a topic
  void toggleTopicSave(Map<String, dynamic> topic) {
    if (isTopicSaved(topic)) {
      removeTopic(topic);
    } else {
      addTopic(topic);
    }
  }
}