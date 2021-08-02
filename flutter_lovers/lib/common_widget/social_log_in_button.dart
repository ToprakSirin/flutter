import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  //final double yukseklik;
  // Widget buttonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.radius,
      //required this.yukseklik,
      // required this.buttonIcon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
