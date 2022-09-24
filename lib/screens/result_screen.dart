import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';

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
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
