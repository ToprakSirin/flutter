import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/components/layout/custom_bottom_bar/tab_item.dart';
import 'package:tracker/views/driver_view/defined_srudent/defined_student_view.dart';
import 'package:tracker/views/driver_view/driver_home/driver_home_view.dart';
import 'package:tracker/views/driver_view/driver_tabs/driver_tabs.dart';
import 'package:tracker/views/driver_view/next_student/next_student_view.dart';
import 'package:tracker/views/driver_view/student_detail/student_detail_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar(
      {Key key,
      @required this.currentTab,
      @required this.onSelectedTab,
      @required this.pageBuilder,
      @required this.navigatorKeys})
      : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pageBuilder;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        iconSize: 30,
        activeColor: Colors.black,
        inactiveColor: Colors.black38,
        backgroundColor: Theme.of(context).canvasColor,
        items: [
          _createNavItem(TabItem.Home),
          _createNavItem(TabItem.NextStudent),
          _createNavItem(TabItem.DefinedStudent),
        ],
        onTap: (index) => widget.onSelectedTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final showItem = TabItem.values[index];
        return CupertinoTabView(
            routes: {
              '/': (ctx) => DriverTabs(),
              DriverHomeView.routeName: (ctx) => DriverHomeView(),
              StudentDetailView.routeName: (ctx) => StudentDetailView(),
              NextStudentView.routeName: (ctx) => NextStudentView(),
              DefinedStudentView.routeName: (ctx) => DefinedStudentView()
            },
            navigatorKey: widget.navigatorKeys[showItem],
            builder: (context) => widget.pageBuilder[showItem]);
      },
    );
  }

  BottomNavigationBarItem _createNavItem(TabItem tabItem) {
    final tabToCreate = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(
        label: tabToCreate.title, icon: Icon(tabToCreate.icon));
  }
}
