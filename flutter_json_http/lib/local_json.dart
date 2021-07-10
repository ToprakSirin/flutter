import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_json_http/models/araba.dart';

class LocalJsonKullanimi extends StatefulWidget {
  LocalJsonKullanimi({Key? key}) : super(key: key);

  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List<Araba>? tumarabalar;

  @override
  void initState() {
    super.initState();
    debugPrint("init state çalıştı");
    /* veriKaynaginiOku().then((gelenarabaListesi) {
      setState(() {
        tumarabalar = gelenarabaListesi;
      });
    }); */
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Container(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, AsyncSnapshot<List<Araba>> sonuc) {
            if (sonuc.hasData) {
              tumarabalar = sonuc.data;
              return ListView.builder(
                itemCount: tumarabalar!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(tumarabalar![index].arabaAdi.toString()),
                    subtitle: Text(tumarabalar![index].ulke.toString()),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
/*   @override
  Widget build(BuildContext context) {
    debugPrint("build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: tumarabalar!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(tumarabalar![index]["araba_adi"]),
              subtitle: Text(tumarabalar![index]["ulke"]),
            );
          },
        )
      ),
    );
  } */

  Future<List<Araba>> veriKaynaginiOku() async {
    /* Future<String> jsonOku =
        DefaultAssetBundle.of(context).loadString('assets/data/araba.json');
    jsonOku.then((okunanJson) {
      debugPrint("gelen json:" + okunanJson);
      return okunanJson;
    }); */

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString('assets/data/araba.json');
    debugPrint(gelenJson);

    List<Araba> arabaListesi = (json.decode(gelenJson) as List)
        .map((mapYapisi) => Araba.fromJson(mapYapisi))
        .toList();
    debugPrint("toplam araba sayısı:" + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka:" + arabaListesi[i].arabaAdi.toString());
      debugPrint("Ülkesi:" + arabaListesi[i].ulke.toString());
    }
    return arabaListesi;
  }
}
