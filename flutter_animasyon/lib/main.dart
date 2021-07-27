import 'package:flutter/material.dart';

import 'animasyon_widgetlari.dart';
import 'new_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController? controller;
  Animation? animation;
  Animation? animation2;
  Animation? animation3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller!.addListener(() {
      setState(() {
        //debugPrint(controller!.value.toString());
        // debugPrint(animation!.value.toString());
      });
    });

    // animation = Tween<double>(begin: 20, end: 150).animate(controller!);

    animation =
        ColorTween(begin: Colors.red, end: Colors.yellow).animate(controller!);
    animation3 = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    animation2 = AlignmentTween(begin: Alignment(-1, -1), end: Alignment(1, 1))
        .animate(controller!);

    controller!.reverse(from: 100);
    controller!.addStatusListener((durum) {
      if (durum == AnimationStatus.completed) {
        controller!.reverse().orCancel;
      } else if (durum == AnimationStatus.dismissed) {
        controller!.forward().orCancel;
      } else {
        debugPrint("Durum: " + durum.toString());
      }
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: animation3!.value * 24),
            ),
            Container(
              alignment: animation2!.value,
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: controller!.value + 20),
              ),
            ),
            Hero(
              tag: 'emre',
              child: FlutterLogo(
                size: 64,
                style: FlutterLogoStyle.stacked,
                textColor: Colors.purple,
              ),
            ),
            ElevatedButton(
              child: Text("Next page"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Animasyonlu Widgetlar"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnimasyonluWidgetlar(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
