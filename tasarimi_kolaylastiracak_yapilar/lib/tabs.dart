import 'package:flutter/material.dart';

class TabOrnek extends StatefulWidget {
  TabOrnek({Key? key}) : super(key: key);

  @override
  _TabOrnekState createState() => _TabOrnekState();
}

class _TabOrnekState extends State<TabOrnek>
    with SingleTickerProviderStateMixin {
  late Tab tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this) as Tab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Kullanımı"),
        bottom: TabBar(
          
          tabs: [
            Tab(
              icon: Icon(Icons.lock),
              text: "Tab1",
            ),
            Tab(
              icon: Icon(Icons.add_box),
              text: "Tab2",
            ),
          ],
        ),
      ),
    );
  }
}
