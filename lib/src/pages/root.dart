import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/components/navigator.dart';
import 'package:picbox/src/common/design/colors.dart';
import 'package:picbox/src/pages/tabs.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<BottomBarTab> _tabs = [
    BottomBarTab(
      initPageBuilder: (context) => HomeTab(),
      iconData: MdiIcons.compassOutline,
      selectedIconData: MdiIcons.compass,
    ),
    BottomBarTab(
      initPageBuilder: (context) => SearchTab(),
      iconData: Icons.search,
    ),
    BottomBarTab(
      initPageBuilder: (context) => NotificationsTab(),
      iconData: Icons.notifications_none,
      selectedIconData: Icons.notifications,
      badge: true,
    ),
    BottomBarTab(
      initPageBuilder: (context) => ProfileTab(),
      iconData: MdiIcons.accountCircleOutline,
      selectedIconData: MdiIcons.accountCircle,
    ),
  ];

  @override
  Widget build(BuildContext context) => MultiNavigatorBottomBar(
        initTabIndex: 0,
        tabs: _tabs,
        backgroundColor: ColorPalette.bottomNavigation,
        color: Colors.white54,
        selectedColor: Colors.white,
      );
}
