import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  Widget buttonIcon;
  final VoidCallback onPressed;

  SocialLoginButton({
    required this.buttonText,
    this.buttonColor: Colors.purple,
    this.textColor: Colors.white,
    this.radius: 16,
    this.yukseklik: 50,
    required this.buttonIcon,
    required this.onPressed,
    // assert ile buton textin null kullanılmaya çalışılması halinde hatanın kaynağını göstermek için kullanılır
  }) : assert(buttonText != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: yukseklik,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Spreads,Collection-if,Colletcion-For
              if (buttonIcon != null) ...[
                buttonIcon,
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                Opacity(
                  child: buttonIcon,
                  opacity: 0,
                )
              ],
              if (buttonIcon == null) ...[
                buttonIcon,
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                Container(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}


/*
buttonIcon != null ? buttonIcon : Container(),
              Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
              buttonIcon != null
                  ? Opacity(
                      child: buttonIcon,
                      opacity: 0,
                    )
                  : Container(),


 */