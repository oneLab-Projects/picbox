import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

/// Создаёт элемент нижней панели навигации. Так же принимает
/// `badge` для отображения статуса непрочитанной информации.
class UBottomNavigationBarItem {
  UBottomNavigationBarItem({
    @required this.iconData,
    this.selectedIconData,
    this.badge = false,
  }) : assert(iconData != null);
  IconData iconData;
  IconData selectedIconData;
  bool badge;
}

/// Создаёт нижнюю панель навигации. Так же принимает `body` для
/// правильной координации при изменении ориентации устройства.
class UBottomNavigationBar extends StatefulWidget {
  UBottomNavigationBar({
    @required this.items,
    this.iconSize: 24,
    this.onTabSelected,
  }) : assert(items != null);

  @required
  final List<UBottomNavigationBarItem> items;
  final double iconSize;
  final ValueChanged<int> onTabSelected;

  static const double heightNavigationBarVertical = 50;
  static const double weightNavigationBarHorisontal = 60;

  /// Возвращает значение выравнивания контента, в зависимости от ориентации
  /// устройства, для корректного отображения `body`.
  static Alignment getAlignment(NativeDeviceOrientation orientation) {
    if (orientation == NativeDeviceOrientation.landscapeLeft)
      return Alignment.centerRight;
    else
      return (orientation == NativeDeviceOrientation.landscapeRight)
          ? Alignment.centerLeft
          : Alignment.bottomCenter;
  }

  _UBottomNavigationBarState createState() => _UBottomNavigationBarState();
}

class _UBottomNavigationBarState extends State<UBottomNavigationBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return NativeDeviceOrientationReader(
      builder: (context) {
        NativeDeviceOrientation orientation;
        orientation = NativeDeviceOrientationReader.orientation(context);

        return _buildBottomNavigationBar(context, items, orientation);
      },
    );
  }

  /// Возвращает значение [Border], в зависимости от ориентации устройства.
  Border _alignmentToBorder(Alignment alignment, BorderSide side) {
    if (alignment == Alignment.centerRight)
      return Border(left: side);
    else if (alignment == Alignment.centerLeft)
      return Border(right: side);
    else
      return Border(top: side);
  }

  /// Создаёт нижнюю панель навигации.
  Widget _buildBottomNavigationBar(BuildContext context, List<Widget> items,
      NativeDeviceOrientation orientation) {
    double height =
        UBottomNavigationBar.getAlignment(orientation) == Alignment.bottomCenter
            ? UBottomNavigationBar.heightNavigationBarVertical
            : double.infinity;
    double width =
        UBottomNavigationBar.getAlignment(orientation) == Alignment.bottomCenter
            ? double.infinity
            : UBottomNavigationBar.weightNavigationBarHorisontal;
    Axis direction =
        UBottomNavigationBar.getAlignment(orientation) == Alignment.bottomCenter
            ? Axis.horizontal
            : Axis.vertical;
    double marginTop =
        UBottomNavigationBar.getAlignment(orientation) == Alignment.bottomCenter
            ? 0
            : MediaQuery.of(context).padding.top;

    return Align(
      alignment: UBottomNavigationBar.getAlignment(orientation),
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            SizedBox(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  constraints:
                      BoxConstraints.expand(height: height, width: width),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.5),
                    border: _alignmentToBorder(
                      UBottomNavigationBar.getAlignment(orientation),
                      BorderSide(
                        color: Theme.of(context).dividerColor.withAlpha(35),
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: Container(
                constraints:
                    BoxConstraints.expand(height: height, width: width),
                margin: EdgeInsets.only(
                  top: marginTop,
                ),
                child: Center(
                  child: Flex(
                    direction: direction,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: items,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Создаёт элемент нижней панели навигации.
  Widget _buildTabItem({
    UBottomNavigationBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    IconData iconData = _selectedIndex == index && item.selectedIconData != null
        ? item.selectedIconData
        : item.iconData;
    return Expanded(
      child: SizedBox.expand(
        child: InkWell(
          splashColor: Colors.black12,
          highlightColor: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          onTap: () => onPressed(index),
          child: Stack(
            children: <Widget>[
              Center(child: Icon(iconData, size: widget.iconSize)),
              Positioned(
                bottom: 33,
                left: 59,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut,
                  width: item.badge ? 8 : 0,
                  height: item.badge ? 8 : 0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
