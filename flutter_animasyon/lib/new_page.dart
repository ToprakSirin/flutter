import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class NewPage extends StatefulWidget {
  NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  SequenceAnimation? sequenceAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration.zero,
            to: Duration(milliseconds: 200),
            tag: "opacity")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(milliseconds: 250),
            to: Duration(milliseconds: 500),
            tag: "width")
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 150),
            from: Duration(milliseconds: 500),
            to: Duration(milliseconds: 750),
            tag: "height")
        .addAnimatable(
            animatable: EdgeInsetsGeometryTween(
              begin: EdgeInsets.only(bottom: 16),
              end: EdgeInsets.only(bottom: 75),
            ),
            from: Duration(milliseconds: 750),
            to: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            tag: "padding")
        .addAnimatable(
            animatable: new BorderRadiusTween(
              begin: new BorderRadius.circular(4.0),
              end: new BorderRadius.circular(75.0),
            ),
            from: Duration(milliseconds: 750),
            to: Duration(milliseconds: 1000),
            curve: Curves.ease,
            tag: "border")
        .animate(controller!); //opacity için

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller!,
          builder: (BuildContext context, Widget? child) {
            return Container(
              padding: sequenceAnimation!["padding"].value,
              child: Opacity(
                opacity: sequenceAnimation!["opacity"].value,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.orange),
                  ),
                  width: sequenceAnimation!["width"].value,
                  height: sequenceAnimation!["height"].value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
