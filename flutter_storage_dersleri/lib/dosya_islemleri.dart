import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class DosyaIslemleri extends StatefulWidget {
  DosyaIslemleri({Key? key}) : super(key: key);

  @override
  _DosyaIslemleriState createState() => _DosyaIslemleriState();
}

class _DosyaIslemleriState extends State<DosyaIslemleri> {
  var mytextController = TextEditingController();

  //Oluşturulacak Dosyanın Klasor Yolu
  Future<String> get getKlasorYolu async {
    Directory klasor = await getApplicationDocumentsDirectory();
    debugPrint("Klasoru pathi" + klasor.path);
    return klasor.path;
  }

  //Dosya Oluştur
  Future<File> get dosyaOlustur async {
    var olusturulacakDosyaKlasorununYolu = await getKlasorYolu;
    return File(olusturulacakDosyaKlasorununYolu + "/myDosya.txt");
  }

  //Dosya Okuma İşlemleri
  Future<String> get dosyaOku async {
    try {
      var myDosya = await dosyaOlustur;
      String dosyaIcerigi = await myDosya.readAsString();
      return dosyaIcerigi;
    } catch (e) {
      return "Hata Çıktı $e";
    }
  }

  //Dosyaya Yaz
  Future<File> dosyayaYaz(String yazilacakString) async {
    var myDosya = await dosyaOlustur;
    return myDosya.writeAsString(yazilacakString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dosya İşlemleri"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: mytextController,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Burada değerler dosyaya kaydedilir."),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _dosyaYaz,
                child: Text("Dosyaya Yaz"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
              ElevatedButton(
                onPressed: _dosyaOku,
                child: Text("Dosyadan Oku"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ),
        ],
      )),
    );
  }

  void _dosyaYaz() {
    dosyayaYaz(mytextController.text.toString());
  }

  void _dosyaOku() async {
    //debugPrint(await dosyaOku);
    dosyaOku.then((icerik) {
      debugPrint(icerik);
    });
  }
}
