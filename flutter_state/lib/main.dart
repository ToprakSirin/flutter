import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/auth_service.dart';
import 'package:flutter_state/counter.dart';
import 'package:flutter_state/sayac_with_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Flutter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Provider ile sayaç uygulaması"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider<Counter>(
                          create: (_) => Counter(0),
                        ),
                        ChangeNotifierProvider(
                            create: (context) => AuthService()),
                      ],
                      child: ProviderSayacUygulamasi(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: MyBottom(_incrementCounter), //
    );
  }
}

class MyBottom extends StatefulWidget {
  Function? incrementCounter;
  MyBottom(this.incrementCounter);

  @override
  _MyBottomState createState() => _MyBottomState();
}

class _MyBottomState extends State<MyBottom> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          widget.incrementCounter;
        });
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
