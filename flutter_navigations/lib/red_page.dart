import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);
  int _rastgelesayi = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('on will pop Çalıştı');
        if (_rastgelesayi == 0) {
          _rastgelesayi = Random().nextInt(100);
          Navigator.pop(context, _rastgelesayi);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Red Page'),
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Red Page',
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  _rastgelesayi = Random().nextInt(100);
                  print("Üretilen sayı $_rastgelesayi");
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Geri Dön',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    print("Evet pop olabilir..");
                  } else {
                    print("Hayır olamaz");
                  }
                },
                style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
                child: Text(
                  'Can Pop Kullanımı',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/orangepage');
                },
                style:
                    ElevatedButton.styleFrom(primary: Colors.orange.shade600),
                child: Text(
                  'Goto Orange',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
