import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/components/navigation_bar.dart';
import 'package:picbox/src/common/design/colors.dart';
import 'package:picbox/src/pages/tabs.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabs = [
    HomeTab(),
    SearchTab(),
    NotificationsTab(),
    ProfileTab(),
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(
        body: IndexedStack(
          index: _currentIndex,
          children: _tabs,
        ),
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
            selectedIconData: Icons.notifications,
          ),
          NavigationBarItem(
              iconData: MdiIcons.accountCircleOutline,
              selectedIconData: MdiIcons.accountCircle),
        ],
      ),
    );
  }
}
