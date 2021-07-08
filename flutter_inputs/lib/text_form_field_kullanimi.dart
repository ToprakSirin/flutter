import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFiledKullanimi extends StatefulWidget {
  TextFormFiledKullanimi({Key? key}) : super(key: key);

  @override
  _TextFormFiledKullanimiState createState() => _TextFormFiledKullanimiState();
}

class _TextFormFiledKullanimiState extends State<TextFormFiledKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textform field kullanimi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  //initialValue: 'emrealtunbilek',
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Username'),
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return 'Username en az 4 karakter olmalıdır.';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  //initialValue: 'emrealtunbilek@gmail.com',
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Email'),
                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
                      return 'Geçerli mail giriniz';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  //initialValue: 'emrealtunbilek@gmail.com',
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password'),
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return 'Şifre en az altı karakter olmalıdır.';
                    } else
                      return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
