import 'package:flutter/material.dart';

class DropDownButtonveDropDownMenuKullanimi extends StatefulWidget {
  DropDownButtonveDropDownMenuKullanimi({Key? key}) : super(key: key);

  @override
  _DropDownButtonveDropDownMenuKullanimiState createState() =>
      _DropDownButtonveDropDownMenuKullanimiState();
}

class _DropDownButtonveDropDownMenuKullanimiState
    extends State<DropDownButtonveDropDownMenuKullanimi> {
  String secilenRenk = "Kirmizi";
  String secilenSehir = "Ankara";
  List<String>? sehirler = ["Ankara", "Bursa", "İzmir", "Hatay"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Diğer Form Elemanları'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Kırmızı"),
                    ],
                  ),
                  value: "Kirmizi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.green,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Yeşil"),
                    ],
                  ),
                  value: "Yesil",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.purple,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Mor"),
                    ],
                  ),
                  value: "Mor",
                ),
              ],
              onChanged: (secilen) {
                setState(() {
                  secilenRenk = secilen!;
                });
              },
              hint: Text("Seçiniz"),
              value: secilenRenk,
            ),
            DropdownButton(
              items: sehirler!.map((oankiSehir) {
                return DropdownMenuItem(
                  child: Text(oankiSehir),
                  value: oankiSehir,
                );
              }).toList(),
              onChanged: (s) {
                setState(() {
                  secilenSehir = s.toString();
                });
              },
              value: secilenSehir,
            ),
          ],
        ),
      ),
    );
  }
}
