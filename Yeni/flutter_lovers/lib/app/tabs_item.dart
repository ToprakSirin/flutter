import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { Kullanicilar, Konusmalarim, Profil }

class TabItemData {
  IconData icon;
  String labelText;
  TabItemData({required this.icon, required this.labelText});

  static Map<TabItem, TabItemData> tumTablar = {
    TabItem.Kullanicilar: TabItemData(
        icon: Icons.supervised_user_circle, labelText: "Kullanıcılar"),
    TabItem.Konusmalarim:
        TabItemData(icon: Icons.chat, labelText: "Konusmalarim"),
    TabItem.Profil: TabItemData(icon: Icons.person, labelText: "profil"),
  };
}
