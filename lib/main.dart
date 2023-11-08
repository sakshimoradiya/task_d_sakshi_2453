import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_d_sakshi_2453/view/screen/homePage.dart';
import 'package:task_d_sakshi_2453/view/screen/splashPage.dart';


Future<void> _firebadeMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(); // options: DefaultFirebaseConfig.platformOptions
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebadeMessagingBackgroundHandler);

  runApp(const MyApp(),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          theme: ThemeData(
            textTheme: const TextTheme(
            ),
          ),
          debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
        );
  }
}


