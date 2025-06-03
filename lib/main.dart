import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentication/screens/Welcome/welcom_screen.dart';
import 'package:flutter_application_1/src/features/core/controlers/topic_controller.dart';
import 'package:flutter_application_1/src/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the TopicController
    Get.put(TopicController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: WelcomScreen(),
    );
  }
}
