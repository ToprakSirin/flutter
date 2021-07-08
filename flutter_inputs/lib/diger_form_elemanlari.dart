import 'package:flutter/material.dart';

class CheckBoxRadioSwitchKullanimi extends StatefulWidget {
  CheckBoxRadioSwitchKullanimi({Key? key}) : super(key: key);

  @override
  _CheckBoxRadioSwitchKullanimiState createState() =>
      _CheckBoxRadioSwitchKullanimiState();
}

class _CheckBoxRadioSwitchKullanimiState
    extends State<CheckBoxRadioSwitchKullanimi> {
  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
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
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi!;
                });
              },
              activeColor: Colors.orange,
              title: Text("CheckBox title"),
              subtitle: Text("Checkbox Subtitle"),
              secondary: Icon(Icons.add),
              selected: true,
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer: $deger");
                });
              },
              title: Text("Ankara"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "Bursa",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer: $deger");
                });
              },
              title: Text("Bursa"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: "İzmir",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer :$deger");
                });
              },
              title: Text("İzmir"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  debugPrint("Anlaşma onaylandı: $deger");
                  switchState = deger;
                });
              },
              title: Text("Switch Title"),
              subtitle: Text("Switch subTitle"),
              secondary: Icon(Icons.refresh),
            ),
            Text("Değeri sliderden seçiniz"),
            Slider(
                value: sliderDeger,
                onChanged: (yeniDeger) {
                  setState(() {
                    sliderDeger = yeniDeger;
                  });
                },
                min: 10,
                max: 20,
                divisions: 20,
                label: sliderDeger.toString())
          ],
        ),
      ),
    );
  }
}
