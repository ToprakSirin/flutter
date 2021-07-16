import 'package:flutter/material.dart';

class LoginIslemleri extends StatefulWidget {
  LoginIslemleri({Key? key}) : super(key: key);

  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Islmeleri"),
      ),
      body: Center(),
    );
  }
}
