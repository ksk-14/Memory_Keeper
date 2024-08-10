import 'package:flutter/material.dart';
import 'views/login_v.dart' as login;

void main() {
  runApp(const AppBase());
}

class AppBase extends StatelessWidget {
  const AppBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Keeper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 125)),
        useMaterial3: true,
      ),
      home: const login.LoginPage(title: 'Memory Keeper'),
    );
  }
}

