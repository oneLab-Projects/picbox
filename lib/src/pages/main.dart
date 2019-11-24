import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/components/navigation_bar.dart';
import 'package:picbox/src/common/design/colors.dart';
import 'package:picbox/src/pages/tabs.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController tabController;
  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    NotificationsTab(),
    ProfileTab(),
    DebugTab(),
  ];

  Widget _currentTab = HomeTab();

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _currentTab = tabs[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(
        body: _currentTab,
        onTabSelected: _selectedTab,
        backgroundColor: ColorPalette.bottomNavigation,
        color: Colors.white54,
        selectedColor: Colors.white,
        items: [
          NavigationBarItem(
              iconData: MdiIcons.compassOutline,
              selectedIconData: MdiIcons.compass),
          NavigationBarItem(iconData: Icons.search),
          NavigationBarItem(
              iconData: Icons.notifications_none,
              selectedIconData: Icons.notifications),
          NavigationBarItem(
              iconData: MdiIcons.accountCircleOutline,
              selectedIconData: MdiIcons.accountCircle),
          NavigationBarItem(
              iconData: MdiIcons.bugOutline, selectedIconData: MdiIcons.bug),
        ],
      ),
    );
  }
}
