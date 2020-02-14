import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:picbox/component/routes.dart';
import 'package:picbox/ui/widget/pansy.dart';

import 'animated_indexed_stack.dart';

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
  })  : _navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>(),
        assert(initPageBuilder != null || iconData != null);
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
  }) : assert(tabs != null);

  static bool _defaultShouldHandlePop() => true;

  @override
  State<StatefulWidget> createState() => _UNestedNavigatorState(initTabIndex);
}

class _UNestedNavigatorState extends State<UNestedNavigator> {
  int currentIndex;

  _UNestedNavigatorState(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.shouldHandlePop()
            ? !await widget.tabs[currentIndex]._navigatorKey.currentState
                .maybePop()
            : false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildBottomBarBackground(),
            _buildPageBody(),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  /// Создаёт стек, хранящий в себе все вкладки.
  Widget _buildPageBody() {
    return NativeDeviceOrientationReader(builder: (context) {
      return Padding(
        padding: _getPadding(
          NativeDeviceOrientationReader.orientation(context),
        ),
        child: AnimatedIndexedStack(
          index: currentIndex,
          children: widget.tabs.map((tab) => _buildNavigator(tab)).toList(),
        ),
      );
    });
  }

  /// Создаёт задний фон нижней панели навигации.
  Widget _buildBottomBarBackground() {
    return NativeDeviceOrientationReader(builder: (context) {
      NativeDeviceOrientation orientation;
      orientation = NativeDeviceOrientationReader.orientation(context);
      double height = UBottomNavigationBar.getAlignment(orientation) ==
              Alignment.bottomCenter
          ? UBottomNavigationBar.heightNavigationBarVertical
          : double.infinity;
      double width = UBottomNavigationBar.getAlignment(orientation) ==
              Alignment.bottomCenter
          ? double.infinity
          : UBottomNavigationBar.weightNavigationBarHorisontal;
      return Align(
        alignment: UBottomNavigationBar.getAlignment(orientation),
        child: Container(
          color: widget.backgroundColor,
          height: height,
          width: width,
        ),
      );
    });
  }

  /// Возвращает значение отступов, в зависимости от ориентации
  /// устройства, для корректного отображения `body`.
  EdgeInsets _getPadding(NativeDeviceOrientation orientation) {
    if (orientation == NativeDeviceOrientation.landscapeLeft)
      return const EdgeInsets.only(
          right: UBottomNavigationBar.weightNavigationBarHorisontal);
    else
      return (orientation == NativeDeviceOrientation.landscapeRight)
          ? const EdgeInsets.only(
              left: UBottomNavigationBar.weightNavigationBarHorisontal)
          : const EdgeInsets.only(
              bottom: UBottomNavigationBar.heightNavigationBarVertical);
  }

  /// Создаёт вкладку.
  Widget _buildNavigator(UNestedTabModel tab) => UNestedTab(
        navigatorKey: tab._navigatorKey,
        initPageBuilder: tab.initPageBuilder,
      );

  /// Создаёт нижнюю панель навигации.
  Widget _buildBottomBar() => UBottomNavigationBar(
        onTabSelected: (index) {
          if (widget.onTap != null) widget.onTap(index);
          FocusScope.of(context).unfocus();
          setState(() => currentIndex = index);
        },
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
            Routes.onGenerateRoute(routeSettings, initPageBuilder),
      );
}
