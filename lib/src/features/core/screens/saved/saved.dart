import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/features/core/controllers/topic_controller.dart';
import 'package:flutter_application_1/src/features/core/controllers/navbar.dart';
import 'package:flutter_application_1/src/features/core/screens/topics/all_topic.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TopicController topicController = Get.find();
    final NavigationController navigationController = Get.find();
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 139, 47, 49),
        ),
        title: IconButton(
          onPressed: () {},
          icon: Image(image: AssetImage(tLogo), height: height * 0.05),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tCardBgColor,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 139, 47, 49),
            ),
            onSelected: (value) {
              if (value == 'clear_all') {
                topicController.savedTopics.clear();
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(value: 'help', child: Text('Help')),
                  const PopupMenuItem(
                    value: 'clear_all',
                    child: Text('Clear All'),
                  ),
                ],
          ),
        ],
      ),
      body: Obx(() {
        if (topicController.savedTopics.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(tNoSavedTopicsImg, height: 150),
                const SizedBox(height: 20),
                const Text(
                  'No saved topics yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    navigationController.selectedIndex.value = 1;
                  },
                  child: const Text(
                    'Browse Topics',
                    style: TextStyle(color: tPrimaryColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: topicController.savedTopics.length,
          itemBuilder: (context, index) {
            final topic = topicController.savedTopics[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Image(
                    image: AssetImage(topic['image'] ?? tDefaultTopicImg),
                    width: 30,
                  ),
                ),
                title: Text(
                  topic['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.bookmark, color: Colors.red),
                  onPressed: () => topicController.removeTopic(topic),
                ),
                onTap: () {
                  if (topic['screen'] != null) {
                    Get.to(() => topic['screen'] as Widget);
                  } else {
                    Get.to(() => AllTopicsScreen());
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}
