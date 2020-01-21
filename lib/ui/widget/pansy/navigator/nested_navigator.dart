import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// Создаёт вкладку, работающую с [UNestedNavigator].
class UNestedTab {
  final WidgetBuilder initPageBuilder;
  final IconData iconData;
  final IconData selectedIconData;
  final bool badge;
  final GlobalKey<NavigatorState> _navigatorKey;

  UNestedTab({
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
  final List<UNestedTab> tabs;
  final PageRoute pageRoute;
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
    this.pageRoute,
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

  Widget _buildPageBody() => IndexedStack(
        index: currentIndex,
        children: widget.tabs.map((tab) => _buildNavigator(tab)).toList(),
      );

  Widget _buildNavigator(UNestedTab tab) => TabPageNavigator(
        navigatorKey: tab._navigatorKey,
        initPageBuilder: tab.initPageBuilder,
        pageRoute: widget.pageRoute,
      );

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

class TabPageNavigator extends StatelessWidget {
  TabPageNavigator(
      {@required this.navigatorKey,
      @required this.initPageBuilder,
      this.pageRoute});

  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetBuilder initPageBuilder;
  final PageRoute pageRoute;

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        observers: [HeroController()],
        onGenerateRoute: (routeSettings) =>
            pageRoute ??
            MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (context) =>
                  _defaultPageRouteBuilder(routeSettings.name)(context),
            ),
      );

  WidgetBuilder _defaultPageRouteBuilder(String routName, {String heroTag}) =>
      (context) => initPageBuilder(context);
}
