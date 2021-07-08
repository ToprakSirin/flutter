import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  StepperOrnek({Key? key}) : super(key: key);

  @override
  _StepperOrnekState createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep = 0;
  String? isim, mail, sifre;
  late List<Step> tumStepler;
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        title: Text('Stepper Örnek'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: _tumStepler(),
          //type: StepperType.horizontal,
          currentStep: _aktifStep,
          /* onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          }, */
          onStepContinue: () {
            setState(() {
              _ileriButtonuKontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username Giriniz"),
        subtitle: Text("Username AltBaşlık"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "UsernameLabel1",
            hintText: "UsernameHint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "En az 6 karakter giriniz";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Mail Giriniz"),
        subtitle: Text("Mail AltBaşlık"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            focusColor: Colors.red,
            labelText: "MailLabel1",
            hintText: "MailHint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6 && girilenDeger.contains("@")) {
              return "Geçerli mail adresi giriniz giriniz";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Password Giriniz"),
        subtitle: Text("Password AltBaşlık"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "PasswordLabel1",
            hintText: "PasswordHint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Şifre En az 6 karakter olmalı";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void _ileriButtonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    debugPrint("Girilen değerler : isim=> $isim mail=>$mail, şifre=>sifre");
  }
}
