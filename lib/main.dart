import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/decision_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DecisionTree(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
      title: "Quiz App",
    );
  }
}
