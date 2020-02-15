import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:picbox/component/routes.dart';

import 'home/home_page.dart';
import 'notifications/notifications_page.dart';
import 'profile/profile_page.dart';
import 'search/search_page.dart';

/// [RootPage] является главной страницей приложения. Она содержит в себе элементы
/// навигации приложения с помощью [NavigationBar], с использованием [UNestedNavigator]
/// для реализации мультиоконности.
class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  /// Хранит перечисление вкладок, отображаемых в BottomNavigationBar
  final List<UNestedTabModel> _tabs = [
    UNestedTabModel(
      initPageBuilder: (context) => HomeTab(),
      iconData: MdiIcons.compassOutline,
      selectedIconData: MdiIcons.compass,
    ),
    UNestedTabModel(
      initPageBuilder: (context) => SearchTab(),
      iconData: Icons.search,
    ),
    UNestedTabModel(
      initPageBuilder: (context) => NotificationsTab(),
      iconData: Icons.notifications_none,
      selectedIconData: Icons.notifications,
    ),
    UNestedTabModel(
      initPageBuilder: (context) => ProfileTab(),
      iconData: MdiIcons.accountCircleOutline,
      selectedIconData: MdiIcons.accountCircle,
    ),
  ];

  @override
  Widget build(BuildContext context) => UNestedNavigator(
        tabs: _tabs,
        color: Colors.white54,
        selectedColor: Colors.white,
        onGenerateRoute: Routes.onGenerateRoute,
      );
}
