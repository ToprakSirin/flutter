import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _sayac;

  int get sayac => this._sayac;

  Counter(this._sayac);

  void arttir() {
    _sayac++;
    notifyListeners();
  }

  void azalt() {
    _sayac--;
    notifyListeners();
  }
}
