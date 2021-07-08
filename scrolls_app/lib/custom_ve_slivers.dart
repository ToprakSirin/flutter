import 'package:flutter/material.dart';
import 'dart:math' as matematik;

class CustomScrollViewOrnek extends StatelessWidget {
  const CustomScrollViewOrnek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //backgroundColor: Colors.red,
          expandedHeight: 100,
          floating: true,
          pinned: false,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver App Bar"),
            centerTitle: true,
            background: Image.asset(
              "assets/image/logo1.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(4),
          sliver: SliverList(
              delegate: SliverChildListDelegate(sabitlistelemanlari())),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  _dinamikElemanUretenFonksiyon,
                  childCount: 10)),
        ),
        SliverFixedExtentList(
            delegate: SliverChildListDelegate(sabitlistelemanlari()),
            itemExtent: 100),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  _dinamikElemanUretenFonksiyon,
                  childCount: 100),
              itemExtent: 50),
        ),
        //Sabit elemanlarla bir satırda kaç eleman olacağını söyledğimizi grid türü
        SliverGrid(
            delegate: SliverChildListDelegate(sabitlistelemanlari()),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
        //Dinamik elemanlarla bir satırda kaç eleman olacağını söyledğimizi grid türü
        SliverGrid(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)),
        /// Dinamik (builder ile üretilen) elemanlarla bir satırdaki  bir elemanın max genişliğini söylediğmiz grid türü
        SliverGrid(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200)),
     
        
      ],
    );
  }

  List<Widget> sabitlistelemanlari() {
    return [
      Container(
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste elemanı :1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste elemanı :2",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste elemanı :3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste elemanı :4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste elemanı :5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste elemanı :6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  Widget? _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik Liste elemanı :${index + 1}",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255));
  }
}
