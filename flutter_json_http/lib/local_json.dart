import 'package:flutter/material.dart';
import 'dart:convert';

class LocalJsonKullanimi extends StatefulWidget {
  LocalJsonKullanimi({Key? key}) : super(key: key);

  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List? tumarabalar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumarabalar = veriKaynaginiOku();
  }

  @override
  Widget build(BuildContext context) {
    veriKaynaginiOku();
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: tumarabalar!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: tumarabalar![index]["araba_adi"],
              subtitle: tumarabalar![index]["ulke"],
            );
          },
        ),
      ),
    );
  }

  veriKaynaginiOku() async {
    /* Future<String> jsonOku =
        DefaultAssetBundle.of(context).loadString('assets/data/araba.json');
    jsonOku.then((okunanJson) {
      debugPrint("gelen json:" + okunanJson);
      return okunanJson;
    }); */

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString('assets/data/araba.json');
    debugPrint(gelenJson);

    List arabaListesi = json.decode(gelenJson.toString());
    debugPrint("toplam araba sayısı:" + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka:" + arabaListesi[i]["araba_adi"].toString());
      debugPrint("Ülkesi:" + arabaListesi[i]["ulke"].toString());
    }
    return arabaListesi;
  }
}
