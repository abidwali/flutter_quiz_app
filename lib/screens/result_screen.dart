import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/main.dart';

import '../consts/colors.dart';
import '../consts/variables.dart';

class ResultScreen extends StatelessWidget {
  final Function(User?) onSignOut;
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    onSignOut(null);
  }

  const ResultScreen({super.key, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: lightgrey, width: 2),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                        points = 0;
                      },
                      icon: const Icon(
                        CupertinoIcons.home,
                        color: Colors.blue,
                        size: 22,
                      )),
                ),
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
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            Text("Hi #user your score in this quiz is $points"),
          ],
        ),
      ),
    );
  }
}
