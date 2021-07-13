import 'package:flutter/material.dart';

enum TabItem { Home, NextStudent, DefinedStudent }

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData({this.icon, this.title});

  static Map<TabItem, TabItemData> allTabs = {
    TabItem.Home: TabItemData(icon: Icons.group, title: "Students"),
    TabItem.NextStudent:
        TabItemData(icon: Icons.next_plan, title: "Next Student"),
    TabItem.DefinedStudent:
        TabItemData(icon: Icons.verified, title: "Defined Student"),
  };
}
