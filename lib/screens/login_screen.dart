import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function(User?) onSignIn;
  const LoginPage({super.key, required this.onSignIn});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  String error = '';
  bool login = true;

  Future<void> loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text);
      widget.onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
    }
  }

  Future<void> createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text);
      widget.onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _controllerEmail,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: _controllerPassword,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            Text(error),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0XFF0D47A1),
                              Color(0XFF1976D2),
                              Color(0XFF42A5F5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        login ? loginUser() : createUser();
                      },
                      child: Text(login ? "Login" : "Create User"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    login = !login;
                  });
                },
                child: const Text("Switch Login/Create"))
          ],
        ),
      ),
    );
  }
}
