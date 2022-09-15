import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/consts/colors.dart';
import 'package:flutter_quiz_app/consts/images.dart';
import 'package:flutter_quiz_app/consts/text_style.dart';
import 'package:flutter_quiz_app/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizApp(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
      title: "Quiz App",
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [blue, darkBlue],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                balloon2,
              ),
              const SizedBox(
                height: 20,
              ),
              headingText(
                  color: Colors.white, size: 32, text: "Let's Play Quiz"),
              const SizedBox(
                height: 20,
              ),
              normalText(
                color: lightgrey,
                size: 16,
                text: "Do you feel confident? Click continue to start the quiz",
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText(color: blue, size: 18, text: "Continue"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
