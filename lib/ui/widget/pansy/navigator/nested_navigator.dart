import 'package:flutter/material.dart';
import 'package:picbox/component/routes.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// [UNestedTabModel] является моделью для представления вкладки,
/// работающей с [UNestedNavigator].
class UNestedTabModel {
  final WidgetBuilder initPageBuilder;
  final IconData iconData;
  final IconData selectedIconData;
  final bool badge;
  final GlobalKey<NavigatorState> _navigatorKey;

  UNestedTabModel({
    @required this.initPageBuilder,
    @required this.iconData,
    this.selectedIconData,
    this.badge = false,
    GlobalKey<NavigatorState> navigatorKey,
  }) : _navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();
}

/// Создаёт реализацию мультиоконности.
class UNestedNavigator extends StatefulWidget {
  final int initTabIndex;
  final List<UNestedTabModel> tabs;
  final ValueChanged<int> onTap;
  final ValueGetter shouldHandlePop;

  final Color backgroundColor;
  final Color color;
  final Color selectedColor;

  UNestedNavigator({
    @required this.tabs,
    this.initTabIndex = 0,
    this.onTap,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.shouldHandlePop = _defaultShouldHandlePop,
  });

  static bool _defaultShouldHandlePop() => true;

  @override
  State<StatefulWidget> createState() => _UNestedNavigatorState(initTabIndex);
}

class _UNestedNavigatorState extends State<UNestedNavigator> {
  int currentIndex;

  _UNestedNavigatorState(this.currentIndex);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          return widget.shouldHandlePop()
              ? !await widget.tabs[currentIndex]._navigatorKey.currentState
                  .maybePop()
              : false;
        },
        child: Scaffold(
          body: _buildBottomBar(_buildPageBody()),
        ),
      );

  /// Создаёт стек, хранящий в себе все вкладки.
  Widget _buildPageBody() => IndexedStack(
        index: currentIndex,
        children: widget.tabs.map((tab) => _buildNavigator(tab)).toList(),
      );

  /// Создаёт вкладку.
  Widget _buildNavigator(UNestedTabModel tab) => UNestedTab(
        navigatorKey: tab._navigatorKey,
        initPageBuilder: tab.initPageBuilder,
      );

  /// Создаёт нижнюю панель навигации.
  Widget _buildBottomBar(Widget body) => UBottomNavigationBar(
        body: body,
        onTabSelected: (index) {
          if (widget.onTap != null) widget.onTap(index);
          FocusScope.of(context).unfocus();
          setState(() => currentIndex = index);
        },
        backgroundColor: widget.backgroundColor,
        color: widget.color,
        selectedColor: widget.selectedColor,
        items: widget.tabs
            .map((tab) => UBottomNavigationBarItem(
                  iconData: tab.iconData,
                  selectedIconData: tab.selectedIconData,
                  badge: tab.badge,
                ))
            .toList(),
      );
}

/// Создаёт вкладку, работающую с [UNestedNavigator]
class UNestedTab extends StatelessWidget {
  UNestedTab({@required this.navigatorKey, @required this.initPageBuilder});

  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetBuilder initPageBuilder;

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        observers: [HeroController()],
        onGenerateRoute: (routeSettings) =>
            Routes.onGenerateRouteForNestedNavigator(
                routeSettings, _defaultPageRouteBuilder),
      );

  WidgetBuilder _defaultPageRouteBuilder(String routName, {String heroTag}) =>
      (context) => initPageBuilder(context);
}
