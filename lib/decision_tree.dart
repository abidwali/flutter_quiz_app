import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/home_screen.dart';
import 'package:flutter_quiz_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'consts/variables.dart';


class DecisionTree extends StatefulWidget {
  const DecisionTree({super.key});

  @override
  State<DecisionTree> createState() => _DecisionTreeState();
}

class _DecisionTreeState extends State<DecisionTree> {
  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginPage(
        onSignIn: (userCred) => onRefresh(userCred),
      );
    }
    return HomeScreen(
      onSignOut: (userCred) => onRefresh(userCred),
    );
  }
}
