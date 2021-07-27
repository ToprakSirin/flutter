import 'package:flutter/material.dart';

class AnimasyonluWidgetlar extends StatefulWidget {
  AnimasyonluWidgetlar({Key? key}) : super(key: key);

  @override
  _AnimasyonluWidgetlarState createState() => _AnimasyonluWidgetlarState();
}

class _AnimasyonluWidgetlarState extends State<AnimasyonluWidgetlar> {
  var _color = Colors.pink;
  var _width = 200.0;
  var _height = 200.0;
  var _ilkCocukAktif = false;
  var _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animasyonlu Widgetlar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 3),
                height: _height,
                width: _width,
                color: _color,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  _animatedContainerAnimasyonu();
                },
                child: Text("Animated Container"),
              ),
              AnimatedCrossFade(
                firstChild:
                    Image.network("https://picsum.photos/200/300?grayscale"),
                secondChild: Image.network("https://picsum.photos/200"),
                crossFadeState: _ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                onPressed: () {
                  _animatedCrossFade();
                },
                child: Text("Animated Cross fade Animasyonu"),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                onPressed: () {
                  _animatedOpacity();
                },
                child: Text("Animated Opacity Animasyonu"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animatedContainerAnimasyonu() {
    setState(() {
      _color = _color == Colors.pink ? Colors.yellow : Colors.pink;
      _width = _width == 200.0 ? 300.0 : 200.0;
      _height = _height == 200.0 ? 300.0 : 200.0;
    });
  }

  void _animatedCrossFade() {
    setState(() {
      _ilkCocukAktif = !_ilkCocukAktif;
    });
  }

  void _animatedOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }
}
