import 'package:flutter/material.dart';
import '/constants.dart' as consts;
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:firebase_core/firebase_core.dart' as fbCore;

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  String _loginResultMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, right: 50, left: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: consts.ConstStr.mailAddress,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onChanged: (String email) {
                  this._email = email;
                },
              ),
              TextField(
                  decoration: InputDecoration(
                      labelText: consts.ConstStr.password,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onChanged: (String password) {
                    setState(() => this._password = password);
                  }),
              // Debug用
              Text(this._loginResultMsg),
              ElevatedButton(
                onPressed: () => this._firebaseLogin(),
                child: Text(consts.ConstStr.submit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _firebaseLogin() async {
    try {
      final fbAuth.FirebaseAuth auth = fbAuth.FirebaseAuth.instance;
      final fbAuth.UserCredential result =
          await auth.signInWithEmailAndPassword(
        email: this._email,
        password: this._password,
      );
      final fbAuth.User user = result.user!;
      setState(() => this._loginResultMsg = 'Login Success');
    } catch (ex) {
      setState(() => this._loginResultMsg = consts.ConstErr.login);
    }
  }
}
