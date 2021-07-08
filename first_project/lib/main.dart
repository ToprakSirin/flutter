import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Container containerOlustur(String harf, Color renk, {double margin = 0}) {
    return Container(
      width: 75,
      height: 75,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: margin),
      color: renk,
      child: Text(
        harf,
        style: TextStyle(fontSize: 48),
      ),
    );
  }

  Row dartRowunnuOlustur() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        containerOlustur('D', Colors.orange.shade200),
        containerOlustur('A', Colors.orange.shade400),
        containerOlustur('R', Colors.orange.shade500),
        containerOlustur('T', Colors.orange.shade600),
      ],
    );
  }

  Column dersleriColumunuOlustur() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: containerOlustur('E', Colors.orange.shade300, margin: 15),
        ),
        Expanded(
          child: containerOlustur('R', Colors.orange.shade400, margin: 15),
        ),
        Expanded(
          child: containerOlustur('s', Colors.orange.shade500, margin: 15),
        ),
        Expanded(
          child: containerOlustur('L', Colors.orange.shade600, margin: 15),
        ),
        Expanded(
          child: containerOlustur('E', Colors.orange.shade700, margin: 15),
        ),
        Expanded(
          child: containerOlustur('R', Colors.orange.shade800, margin: 15),
        ),
        Expanded(
          child: containerOlustur('İ', Colors.orange.shade300, margin: 15),
        ),
      ],
    );
  }

  String _img1 =
      'https://www.marketimgeldi.com/Uploads/UrunResimleri/buyuk/kirmizi-elma---kg-8fe4.jpg';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Başlık'),
        ),
        body: Container(
          color: Colors.red.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dartRowunnuOlustur(),
              Expanded(child: dersleriColumunuOlustur()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Tıklandı');
          },
          child: Icon(Icons.account_circle_rounded, color: Colors.blue),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  List<Widget> get sorunluContainer {
    return [
      Container(
        width: 75,
        height: 75,
        color: Colors.yellow,
      ),
      Container(
        width: 75,
        height: 75,
        color: Colors.red,
      ),
      Container(
        width: 75,
        height: 75,
        color: Colors.blue,
      ),
      Container(
        width: 75,
        height: 75,
        color: Colors.orange,
      ),
      Container(
        width: 75,
        height: 75,
        color: Colors.blue,
      ),
      Container(
        width: 75,
        height: 75,
        color: Colors.red,
      ),
    ];
  }

  List<Widget> get flexibleContainer {
    return [
      Flexible(
        flex: 1,
        child: Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
        ),
      ),
      Flexible(
        child: Container(
          width: 200,
          height: 300,
          color: Colors.red,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 200,
          height: 300,
          color: Colors.blue,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 200,
          height: 300,
          color: Colors.purple,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 100,
          height: 300,
          color: Colors.red,
        ),
      ),
    ];
  }

  List<Widget> get expandedContainer {
    return [
      Expanded(
        flex: 2,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.red,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.blue,
        ),
      ),
      Expanded(
        child: Container(
          width: 75,
          height: 75,
          color: Colors.orange,
        ),
      ),
    ];
  }

  Container rowColumnDersleri() {
    return Container(
      color: Colors.red.shade300,
      child: Column(
        /* mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch, */
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('E'),
              Text('M'),
              Text('R'),
              Text('E'),
            ],
          ),
          Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.green,
          ),
          Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.red,
          ),
          Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.blue,
          ),
          Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget containerDersleri() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Text(
          'emre',
          style: TextStyle(fontSize: 128),
        ),
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.rectangle,
            border: Border.all(width: 4, color: Colors.purple),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), topRight: Radius.circular(30)),
            image: DecorationImage(
                image: NetworkImage(_img1),
                fit: BoxFit.scaleDown,
                repeat: ImageRepeat.repeat),
            boxShadow: [
              BoxShadow(
                  color: Colors.green, offset: Offset(0, 20), blurRadius: 10),
              BoxShadow(
                  color: Colors.yellow, offset: Offset(0, -20), blurRadius: 10),
            ]),
      ),
    );
  }
}
