import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/consts/colors.dart';
import 'package:flutter_quiz_app/consts/images.dart';
import 'package:flutter_quiz_app/screens/quiz_screen.dart';

import '../consts/text_style.dart';

class HomeScreen extends StatelessWidget {
  final Function(User?) onSignOut;
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    onSignOut(null);
  }

  const HomeScreen({super.key, required this.onSignOut});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: lightgrey, width: 2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        logout();
                      },
                      icon: const Icon(
                        CupertinoIcons.power,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                balloon2,
                height: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              headingText(
                  color: Colors.white, size: 32, text: "Let's Play Quiz"),
              const SizedBox(
                height: 10,
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
