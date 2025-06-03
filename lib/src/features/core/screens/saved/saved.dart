import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/controlers/topic_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TopicController topicController = Get.find();
    var height = MediaQuery.of(context).size.height;

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
            onSelected: (value) {},
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(value: 'help', child: Text('Help')),
                  const PopupMenuItem(value: 'logout', child: Text('Logout')),
                ],
          ),
        ],
      ),
      body: Obx(
        () =>
            topicController.savedTopics.isEmpty
                ? const Center(
                  child: Text(
                    'No saved topics yet',
                    style: TextStyle(fontSize: 18),
                  ),
                )
                : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: topicController.savedTopics.length,
                  itemBuilder: (context, index) {
                    final topic = topicController.savedTopics[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        leading: Image(
                          image: AssetImage(topic.image),
                          width: 40,
                        ),
                        title: Text(topic.title),
                        trailing: IconButton(
                          icon: const Icon(Icons.bookmark, color: Colors.red),
                          onPressed: () => topicController.removeTopic(topic),
                        ),
                        onTap: () => Get.to(() => topic.screen),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
