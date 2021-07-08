import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(
      500,
      (index) => Ogrenci(index + 1, 'Ogrenci adı  ${index + 1}',
          'Ogrenci soyadı  ${index + 1}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Listesi'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var oankiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0
                ? Colors.orange.shade100
                : Colors.purple.shade100,
            child: ListTile(
              onLongPress: () {
                _alertDialogIslemleri(context, oankiOgrenci);
              },
              onTap: () {
                if (index % 2 == 0) {
                  EasyLoading.instance.backgroundColor = Colors.red;
                  EasyLoading.instance.textColor = Colors.green;
                } else {
                  EasyLoading.instance.backgroundColor = Colors.blue;
                }
                EasyLoading.showToast('Eleman tıklandı',
                    duration: Duration(seconds: 3),
                    dismissOnTap: true,
                    toastPosition: EasyLoadingToastPosition.bottom);
              },
              title: Text(oankiOgrenci.isim),
              subtitle: Text(oankiOgrenci.soyisim),
              leading: CircleAvatar(
                child: Text(oankiOgrenci.id.toString()),
              ),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
        separatorBuilder: (context, index) {
          var yeniIndex = index + 1;
          if (yeniIndex % 4 == 0) {
            return Divider(thickness: 2, color: Colors.teal);
          }
          return SizedBox();
        },
      ),
    );
  }

  ListView klasiklistview() {
    return ListView(
      children: tumOgrenciler
          .map((Ogrenci ogr) => ListTile(
                title: Text(ogr.isim),
                subtitle: Text(ogr.soyisim),
                leading: CircleAvatar(
                  child: Text(ogr.id.toString()),
                ),
              ))
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen) {
    showDialog(
        barrierDismissible: false,
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text(secilen.toString()),
            content: SingleChildScrollView(
                child: Column(
              children: [
                Text('emre' * 100),
                Text('emre1' * 100),
                Text('emre2' * 100),
              ],
            )),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('KAPAT'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('TAMAM'),
                  ),
                ],
              )
            ],
          );
        });
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
  @override
  String toString() {
    // TODO: implement toString:
    return 'Isim : $isim Soyisim :$soyisim id: $id';
  }
}
