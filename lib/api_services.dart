// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:http/http.dart' as http;

var link = "https://opentdb.com/api.php?amount=20";

getQuiz() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    return data;
  }
}
