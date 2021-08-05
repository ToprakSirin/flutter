import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/user.dart';

class Konusma extends StatefulWidget {
  MyUser currentUser;
  MyUser sohbetEdileUser;
  Konusma({required this.currentUser, required this.sohbetEdileUser});

  @override
  _KonusmaState createState() => _KonusmaState();
}

class _KonusmaState extends State<Konusma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sohbet"),
        ),
        body: Column(
          children: [
            Text("Current User" + widget.currentUser.userName!),
            Text("Sohbet Edilen User User" + widget.sohbetEdileUser.userName!),
          ],
        ));
  }
}
