import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/components/nested_navigator.dart';
import 'package:picbox/src/common/design/style.dart';
import 'package:picbox/src/pages/tabs.dart';

/// [RootPage] является главной страницей приложения. Она содержит в себе элементы
/// навигации приложения с помощью [NavigationBar], с использованием [NestedNavigator]
/// для реализации мультиоконности.
class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  /// Вкладки, отображаемые в BottomNavigationBar
  final List<NestedTab> _tabs = [
    NestedTab(
      initPageBuilder: (context) => HomeTab(),
      iconData: MdiIcons.compassOutline,
      selectedIconData: MdiIcons.compass,
    ),
    NestedTab(
      initPageBuilder: (context) => SearchTab(),
      iconData: Icons.search,
    ),
    NestedTab(
      initPageBuilder: (context) => NotificationsTab(),
      iconData: Icons.notifications_none,
      selectedIconData: Icons.notifications,
    ),
    NestedTab(
      initPageBuilder: (context) => ProfileTab(),
      iconData: MdiIcons.accountCircleOutline,
      selectedIconData: MdiIcons.accountCircle,
    ),
  ];

  @override
  Widget build(BuildContext context) => NestedNavigator(
        tabs: _tabs,
        backgroundColor: Style.bottomNavigationBarColor,
        color: Colors.white54,
        selectedColor: Colors.white,
      );
}
