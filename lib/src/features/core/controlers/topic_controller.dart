// lib/src/features/core/controllers/topic_controller.dart
import 'package:get/get.dart';
import 'package:flutter_application_1/src/features/core/models/topic_model.dart';

class TopicController extends GetxController {
  final RxList<Topic> _savedTopics = <Topic>[].obs;

  List<Topic> get savedTopics => _savedTopics;

  void saveTopic(Topic topic) {
    if (!_savedTopics.contains(topic)) {
      _savedTopics.add(topic);
    }
  }

  void removeTopic(Topic topic) {
    _savedTopics.remove(topic);
  }

  bool isSaved(Topic topic) {
    return _savedTopics.contains(topic);
  }
}