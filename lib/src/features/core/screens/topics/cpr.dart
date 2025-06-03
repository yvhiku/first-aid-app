import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/controllers/topic_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';

class CprScreen extends StatelessWidget {
  const CprScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TopicController topicController = Get.find();
    // Define the current topic
    final currentTopic = {
      'title': 'CPR Instructions',
      'image': tCprimg, // Make sure this matches your image constant
      'screen': const CprScreen(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('CPR Instructions'),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                topicController.isTopicSaved(currentTopic)
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color:
                    topicController.isTopicSaved(currentTopic)
                        ? Colors.red
                        : null,
              ),
              onPressed: () {
                topicController.toggleTopicSave(currentTopic);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      topicController.isTopicSaved(currentTopic)
                          ? 'Added to saved topics'
                          : 'Removed from saved topics',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: const Center(child: Text('content goes here')),
    );
  }
}
