import 'package:tracker/components/layout/custom_bottom_bar/custom_bottom_nav_bar.dart';
import 'package:tracker/components/layout/custom_bottom_bar/tab_item.dart';
import 'package:tracker/views/driver_view/defined_srudent/defined_student_view.dart';
import 'package:tracker/views/driver_view/driver_home/driver_home_view.dart';
import 'package:tracker/views/driver_view/next_student/next_student_view.dart';
import 'package:flutter/material.dart';

class DriverTabs extends StatefulWidget {
  DriverTabs({Key key}) : super(key: key);

  @override
  _DriverTabsState createState() => _DriverTabsState();
}

class _DriverTabsState extends State<DriverTabs> {
  TabItem _currentTab = TabItem.Home;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Home: GlobalKey<NavigatorState>(),
    TabItem.NextStudent: GlobalKey<NavigatorState>(),
    TabItem.DefinedStudent: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.Home: DriverHomeView(),
      TabItem.NextStudent: NextStudentView(),
      TabItem.DefinedStudent: DefinedStudentView(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CustomBottomNavBar(
        pageBuilder: allPages(),
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (selectedTab) {
          if (selectedTab == _currentTab) {
            navigatorKeys[selectedTab]
                .currentState
                .popUntil((route) => route.isFirst);
          } else {
            setState(() {
              _currentTab = selectedTab;
            });
          }
        },
      ),
    );
  }
}
