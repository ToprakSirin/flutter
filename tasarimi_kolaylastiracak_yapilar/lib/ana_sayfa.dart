import 'package:flutter/material.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/models/veri.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa(Key k) : super(key: k);
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late List<Veri> tumVeriler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumVeriler = [
      Veri("Biz Kimiz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri("Biz Neredeyiz", "Biz Neredeyiz içeriği buraya gelecek", false),
      Veri("Misyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri(" Vizyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri(" Vizyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri(" Vizyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri("Vizyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri("Vizyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
      Veri(" Vizyonumuz", "Biz Kimiz içeriği buraya gelecek", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return ExpansionTile(
          key: PageStorageKey("$index"),
          title: Text(tumVeriler[index].baslik),
          initiallyExpanded: tumVeriler[index].expanded,
          children: [
            Container(
              color:
                  index % 2 == 0 ? Colors.red.shade200 : Colors.yellow.shade300,
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(tumVeriler[index].icerik),
              ),
            )
          ],
        );
      },
      itemCount: tumVeriler.length,
    );
  }
}
