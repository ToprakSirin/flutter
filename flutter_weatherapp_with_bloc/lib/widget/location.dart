import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ankara",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
