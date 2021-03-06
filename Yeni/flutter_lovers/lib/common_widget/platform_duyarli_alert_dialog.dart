import 'dart:io';

import 'package:flutter_lovers/common_widget/platform_duyarli_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDuyarliAlertDialog extends PlatformDuyarliWidget {
  final String baslik;
  final String icerik;
  final String anaButonYazisi;
  final String? iptalButonYazisi;

  PlatformDuyarliAlertDialog(
      {required this.baslik,
      required this.icerik,
      required this.anaButonYazisi,
      this.iptalButonYazisi});

  Future<bool> goster(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog(
            context: context, builder: (context) => this)
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible: false);
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: Text(baslik),
      content: Text(icerik),
      actions: _dialogButonlariAyarla(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(baslik),
      content: Text(icerik),
      actions: _dialogButonlariAyarla(context),
    );
  }

  List<Widget> _dialogButonlariAyarla(BuildContext context) {
    final List<Widget> tumButonlar = <Widget>[];
    if (Platform.isIOS) {
      if (iptalButonYazisi != null) {
        tumButonlar.add(CupertinoDialogAction(
          child: Text(iptalButonYazisi!),
          onPressed: () {
             Navigator.pop(context, false);
          },
        ));
      }
      tumButonlar.add(
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(anaButonYazisi),
        ),
      );
    } else {
      if (iptalButonYazisi != null) {
        tumButonlar.add(TextButton(
          child: Text(iptalButonYazisi!),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ));
      }
      tumButonlar.add(TextButton(
          onPressed: () {
            Navigator.pop(context,true);
          },
          child: Text("Taman")));
    }
    return tumButonlar;
  }
}
