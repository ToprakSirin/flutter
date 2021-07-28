import 'dart:async';

import 'package:flutter/material.dart';

class StreamKullanimi extends StatefulWidget {
  @override
  _StreamKullanimiState createState() => _StreamKullanimiState();
}

class _StreamKullanimiState extends State<StreamKullanimi> {
  final StreamController<int> _streamController = StreamController();
  int _counter = 0;

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have pushed the button this many times",
            ),
            StreamBuilder<int>(
              builder: (context, AsyncSnapshot<int> snapshot) {
                return Text("${snapshot.data}");
              },
              initialData: 0,
              stream: _streamController.stream,
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _streamController.sink.add(++_counter);
            },
            heroTag: "1",
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              _streamController.sink.add(--_counter);
            },
            heroTag: "2",
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
