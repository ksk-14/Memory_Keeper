import 'package:flutter/material.dart';
import '/views/login_v.dart' as login;
import '/constants.dart' as consts;
import 'package:firebase_core/firebase_core.dart' as fbCore;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await fbCore.Firebase.initializeApp();
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
      home: const login.LoginPage(title: consts.ConstStr.loginTitle),
    );
  }
}
