import 'package:tracker/components/layout/decoration.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final Widget child;
  final double height;
  final double width;
  final Function onPress;
  const Button(
      {Key key,
      @required this.color,
      @required this.child,
      @required this.height,
      @required this.width,
      @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: getDecoration(
              color: (onPress == null || onPress == () {})
                  ? Theme.of(context).disabledColor
                  : color),
          child: child),
    );
  }
}
