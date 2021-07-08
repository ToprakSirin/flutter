import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? dersAdi;
  int dersKredi = 1;
  double? dersHarfDegeri;
  late List<Ders> tumDersler;
  static int sayac = 0;

  var formKey = GlobalKey<FormState>();
  double ortalama = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumDersler = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Ortalama Hesapla"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        },
        child: Icon(Icons.add),
      ),
      body: uygulamaGovdesi(),
    );
  }

  Widget uygulamaGovdesi() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Static Formu Tutan Container
          Container(
              child: Form(
            key: formKey,
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ders Adı",
                  hintText: "Ders Adını Giriniz",
                  hintStyle: TextStyle(fontSize: 18),
                  labelStyle: TextStyle(fontSize: 22),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger!.length > 0) {
                    return null;
                  } else
                    return "Ders Adı Boş Olamaz";
                },
                onSaved: (kaydedilenDeger) {
                  dersAdi = kaydedilenDeger;
                  setState(() {
                    tumDersler.add(
                      Ders(dersAdi!, dersHarfDegeri!, dersKredi),
                    );
                    ortalama = 0;
                    ortalamayiHesapla();
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        items: dersKredileriItems(),
                        value: dersKredi,
                        onChanged: (secilenKredi) {
                          setState(() {
                            dersKredi = secilenKredi!;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<double>(
                        hint: Text("AA"),
                        items: dersHarfDegerleriItems(),
                        value: dersHarfDegeri,
                        onChanged: (value) {
                          setState(() {
                            dersHarfDegeri = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 70,
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    top: BorderSide(color: Colors.blue, width: 2),
                    bottom: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: tumDersler.length == 0
                              ? "Lütfen Ders ekleyin"
                              : "Ortalama:",
                          style: TextStyle(fontSize: 30, color: Colors.black)),
                      TextSpan(
                          text: tumDersler.length == 0
                              ? ""
                              : "${ortalama.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ),
              ),
            ]),
          )),

          //Dinamik Formu Tutan Container
          Expanded(
            child: Container(
              color: Colors.green.shade200,
              child: ListView.builder(
                  itemBuilder: _listeElemanlariniOlustur,
                  itemCount: tumDersler.length),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> dersKredileriItems() {
    List<DropdownMenuItem<int>> krediler = [];

    for (int i = 1; i <= 10; i++) {
      krediler.add(
        DropdownMenuItem(
          value: i,
          child: Text(
            "$i Kredi",
            style: TextStyle(fontSize: 30),
          ),
        ),
      );
    }
    return krediler;
  }

  List<DropdownMenuItem<double>> dersHarfDegerleriItems() {
    List<DropdownMenuItem<double>> harfler = [];

    harfler.add(
      DropdownMenuItem(
        child: Text(
          "AA",
          style: TextStyle(fontSize: 30),
        ),
        value: 4,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "BA",
          style: TextStyle(fontSize: 30),
        ),
        value: 3.5,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "BB",
          style: TextStyle(fontSize: 30),
        ),
        value: 3,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "CB",
          style: TextStyle(fontSize: 30),
        ),
        value: 2.5,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "CC",
          style: TextStyle(fontSize: 30),
        ),
        value: 2,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "DC",
          style: TextStyle(fontSize: 30),
        ),
        value: 1.5,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "DD",
          style: TextStyle(fontSize: 30),
        ),
        value: 1,
      ),
    );
    harfler.add(
      DropdownMenuItem(
        child: Text(
          "FF",
          style: TextStyle(fontSize: 30),
        ),
        value: 0,
      ),
    );
    return harfler;
  }

  Widget _listeElemanlariniOlustur(BuildContext context, int index) {
    sayac++;
    debugPrint(sayac.toString());
    return Dismissible(
      key: Key(sayac.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        setState(() {
          tumDersler.removeAt(index);
          ortalamayiHesapla();
        });
      },
      child: Card(
        child: ListTile(
          title: Text(tumDersler[index].ad),
          subtitle: Text(
            tumDersler[index].kredi.toString() +
                "Kredi Ders Not Değeri:" +
                tumDersler[index].harfDegeri.toString(),
          ),
        ),
      ),
    );
  }

  void ortalamayiHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    for (var oankiDers in tumDersler) {
      var kredi = oankiDers.kredi;
      var harfDegeri = oankiDers.harfDegeri;
      toplamNot = toplamNot + (harfDegeri * kredi);
      toplamKredi += kredi;
    
    }
    ortalama = toplamNot / toplamKredi;
  }
}

class Ders {
  String ad;
  double harfDegeri;
  int kredi;

  Ders(this.ad, this.harfDegeri, this.kredi);
}
