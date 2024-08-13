import 'package:flutter/material.dart';
import '../config/constants.dart' as consts;
import '/viewModels/auth_vm.dart' as vmAuth;

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final vmAuth.AuthVm vmAuthIns = new vmAuth.AuthVm();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: new Text(widget.title),
      ),
      body: new Padding(
        padding: new EdgeInsets.only(top: 20.0, right: 50, left: 50),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                    labelText: consts.ConstStr.mailAddress,
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onChanged: (String email) {
                  vmAuthIns.email = email;
                },
              ),
              new TextField(
                  decoration: new InputDecoration(
                      labelText: consts.ConstStr.password,
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                  onChanged: (String password) {
                    setState(() => vmAuthIns.password = password);
                  }),
              // Debug用
              new Text(vmAuthIns.loginResultMsg),
              new ElevatedButton(
                onPressed: () =>
                    vmAuthIns.fbLogin().then((_) => setState(() {})),
                child: new Text(consts.ConstStr.submit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
