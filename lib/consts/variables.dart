  import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

int points = 0;
User? user;
 var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;
  late Future quiz;

  var isLoaded = false;

  var optionsList = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
   resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }