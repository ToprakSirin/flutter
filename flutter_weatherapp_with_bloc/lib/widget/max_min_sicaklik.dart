import 'package:flutter/material.dart';

class MaxveMinSicaklikWidget extends StatelessWidget {
  const MaxveMinSicaklikWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Maksimum : " + 24.toString() + "C",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Minimum : " + 12.toString() + "C",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
