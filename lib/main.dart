import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentication/provider/auth_provider.dart';
import 'package:flutter_application_1/src/features/authentication/screens/Welcome/welcom_screen.dart';
import 'package:flutter_application_1/src/features/core/controllers/navbar.dart';
import 'package:flutter_application_1/src/features/core/controllers/topic_controller.dart';
import 'package:flutter_application_1/src/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TopicController());

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider1())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: Consumer<AuthProvider1>(
          builder: (context, ap, _) {
            return ap.isSignedIn == true
                ? const NavBar()
                : const WelcomeScreen();
          },
        ),
      ),
    );
  }
}
