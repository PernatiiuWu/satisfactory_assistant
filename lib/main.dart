import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:satisfactory_assistant/firebase_options.dart';
import 'package:satisfactory_assistant/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Satisfactory Assistant',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
