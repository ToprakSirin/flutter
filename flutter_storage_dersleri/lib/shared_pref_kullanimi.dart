import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKullanimi extends StatefulWidget {
  SharedPrefKullanimi({Key? key}) : super(key: key);

  @override
  _SharedPrefKullanimiState createState() => _SharedPrefKullanimiState();
}

class _SharedPrefKullanimiState extends State<SharedPrefKullanimi> {
  String? isim;
  int? id;
  bool? cinsiyet;
  var formKey = GlobalKey<FormState>();
  SharedPreferences? mySharedPreferences;

  @override
  void initState() {
    super.initState();
    //mySharedPrefences.getInstance().then((sf) => mySharedPrefences = sf);
    SharedPreferences.getInstance().then((sf) {
      mySharedPreferences = sf;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (deger) {
                    isim = deger;
                  },
                  decoration: InputDecoration(
                    labelText: "İsminizi Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        (10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (deger) {
                    id = int.parse(deger!);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "ID Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        (10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RadioListTile(
                  value: true,
                  groupValue: cinsiyet,
                  onChanged: (secildi) {
                    setState(() {
                      cinsiyet = secildi as bool?;
                    });
                  },
                  title: Text("Erkek"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RadioListTile(
                  value: false,
                  groupValue: cinsiyet,
                  onChanged: (secildi) {
                    setState(() {
                      cinsiyet = secildi as bool?;
                    });
                  },
                  title: Text("Kadın"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _ekle,
                    child: Text("Kaydet"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: _goster,
                    child: Text("Göster"),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                  ElevatedButton(
                    onPressed: _sil,
                    child: Text("Sil"),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _ekle() async {
    formKey.currentState!.save();
    await (mySharedPreferences as SharedPreferences).setString("myName", isim!);
    await mySharedPreferences!.setInt("myId", id!);
    await mySharedPreferences!.setBool("myCinsiyet", cinsiyet!);
  }

  void _goster() {
    debugPrint("Okunan İsim " +
        (mySharedPreferences as SharedPreferences)
            .getString("myName")
            .toString());
    debugPrint("Okunan Id " +
        (mySharedPreferences as SharedPreferences).getInt("myId").toString());
    debugPrint("Cinsiyet Erkek mi " +
        (mySharedPreferences as SharedPreferences)
            .getBool("myCinsiyet")
            .toString());
  }

  void _sil() {
    (mySharedPreferences as SharedPreferences).remove("myName");
    (mySharedPreferences as SharedPreferences).remove("myId");
    (mySharedPreferences as SharedPreferences).remove("myCinsiyet");
  }
}
