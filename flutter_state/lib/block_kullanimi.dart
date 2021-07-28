import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state/block.sayac/sayac_block.dart';
import 'package:flutter_state/block.sayac/sayac_event.dart';

class BlockKullanimi extends StatefulWidget {
  @override
  _BlockKullanimiState createState() => _BlockKullanimiState();
}

class _BlockKullanimiState extends State<BlockKullanimi> {
  final _sayacBlock = SayacBlock();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Block Kullanımı"),
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
                return Text(
                  "${snapshot.data.toString()}",
                  style: TextStyle(fontSize: 40),
                );
              },
              initialData: 0,
              stream: _sayacBlock.sayac,
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
              _sayacBlock.sayacEventSink.add(ArttirmaEvent());
            },
            heroTag: "1",
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              _sayacBlock.sayacEventSink.add(AzalatmaEvent());
            },
            heroTag: "2",
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
