import 'package:flutter/material.dart';

class PopupMenuKullanimi extends StatefulWidget {
  PopupMenuKullanimi({Key? key}) : super(key: key);

  @override
  _PopupMenuKullanimiState createState() => _PopupMenuKullanimiState();
}

class _PopupMenuKullanimiState extends State<PopupMenuKullanimi> {
  String _secilenSehir = '';
  List<String> renkler = ['mavi', 'yesil', 'kırmızı'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton(
        onSelected: (String sehir) {
          setState(() {
            _secilenSehir = sehir;
          });
          print('secilen sehir :$sehir');
        },
        icon: Icon(Icons.add),
        //child:Text(_secilenSehir),
        itemBuilder: (BuildContext context) {
          /* return <PopupMenuEntry<String>>[
            PopupMenuItem(
              child: Text('Ankara'),
              value: 'Ankara',
            ),
            PopupMenuItem(
              child: Text('Bursa'),
              value: 'Bursa',
            ),
            PopupMenuItem(
              child: Text('Van'),
              value: 'Van',
            ),
          ]; */
          return renkler
              .map(
                (String renk) => PopupMenuItem(
                  child: Text(renk),
                  value: renk,
                ),
              )
              .toList();
        },
      ),
    );
  }
}
