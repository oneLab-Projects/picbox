import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

/// Создаёт элемент нижней панели навигации. Так же принимает
/// `badge` для отображения статуса непрочитанной информации.
class UBottomNavigationBarItem {
  UBottomNavigationBarItem(
      {this.iconData, this.selectedIconData, this.badge = false});
  @required
  IconData iconData;
  IconData selectedIconData;
  bool badge;
}

/// Создаёт нижнюю панель навигации. Так же принимает `body` для
/// правильной координации при изменении ориентации устройства.
class UBottomNavigationBar extends StatefulWidget {
  UBottomNavigationBar({
    this.body,
    this.items,
    this.iconSize: 24,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.onTabSelected,
  });

  @required
  final Widget body;
  @required
  final List<UBottomNavigationBarItem> items;
  final double iconSize;
  @required
  final Color backgroundColor;
  @required
  final Color color;
  @required
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  static const double heightNavigationBarVertical = 50;
  static const double weightNavigationBarHorisontal = 60;

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

        return Stack(
          children: <Widget>[
            Padding(
              padding: _getPadding(orientation),
              child: widget.body,
            ),
            _buildBottomNavigationBar(items, orientation),
          ],
        );
      },
    );
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

  /// Создаёт нижнюю панель навигации.
  Widget _buildBottomNavigationBar(items, orientation) {
    double height = _getAlignment(orientation) == Alignment.bottomCenter
        ? UBottomNavigationBar.heightNavigationBarVertical
        : double.infinity;
    double width = _getAlignment(orientation) == Alignment.bottomCenter
        ? double.infinity
        : UBottomNavigationBar.weightNavigationBarHorisontal;
    Axis direction = _getAlignment(orientation) == Alignment.bottomCenter
        ? Axis.horizontal
        : Axis.vertical;
    double marginTop = _getAlignment(orientation) == Alignment.bottomCenter
        ? 0
        : MediaQuery.of(context).padding.top;

    return Align(
      alignment: _getAlignment(orientation),
      child: Material(
        color: widget.backgroundColor,
        child: Container(
          constraints: BoxConstraints.expand(height: height, width: width),
          margin: EdgeInsets.only(
            top: marginTop,
          ),
          child: Flex(
            direction: direction,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ),
    );
  }

  /// Возвращает значение выравнивания контента, в зависимости от ориентации
  /// устройства, для корректного отображения `body`.
  Alignment _getAlignment(NativeDeviceOrientation orientation) {
    if (orientation == NativeDeviceOrientation.landscapeLeft)
      return Alignment.centerRight;
    else
      return (orientation == NativeDeviceOrientation.landscapeRight)
          ? Alignment.centerLeft
          : Alignment.bottomCenter;
  }

  /// Создаёт элемент нижней панели навигации.
  Widget _buildTabItem({
    UBottomNavigationBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
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
              Center(
                  child: Icon(iconData, color: color, size: widget.iconSize)),
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
