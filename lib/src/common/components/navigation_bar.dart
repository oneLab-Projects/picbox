import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

class NavigationBarItem {
  NavigationBarItem({this.iconData, this.selectedIconData});
  IconData iconData;
  IconData selectedIconData;
}

class NavigationBar extends StatefulWidget {
  NavigationBar({
    this.body,
    this.items,
    this.iconSize: 24,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.onTabSelected,
  });

  final Widget body;
  final List<NavigationBarItem> items;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  static const double heightNavigationBarVertical = 50;
  static const double weightNavigationBarHorisontal = 60;

  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
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

    return NativeDeviceOrientationReader(builder: (context) {
      NativeDeviceOrientation orientation =
          NativeDeviceOrientationReader.orientation(context);
      return Stack(
        children: <Widget>[
          Padding(
            padding: getPadding(orientation),
            child: widget.body,
          ),
          _buildNavigationBar(items, orientation),
        ],
      );
    });
  }

  EdgeInsets getPadding(NativeDeviceOrientation orientation) {
    if (orientation == NativeDeviceOrientation.landscapeLeft)
      return EdgeInsets.only(
          right: NavigationBar.weightNavigationBarHorisontal);
    else
      return (orientation == NativeDeviceOrientation.landscapeRight)
          ? EdgeInsets.only(left: NavigationBar.weightNavigationBarHorisontal)
          : EdgeInsets.only(bottom: NavigationBar.heightNavigationBarVertical);
  }

  Widget _buildNavigationBar(items, orientation) {
    double height = getAlignment(orientation) == Alignment.bottomCenter
        ? NavigationBar.heightNavigationBarVertical
        : double.infinity;
    double width = getAlignment(orientation) == Alignment.bottomCenter
        ? double.infinity
        : NavigationBar.weightNavigationBarHorisontal;
    Axis direction = getAlignment(orientation) == Alignment.bottomCenter
        ? Axis.horizontal
        : Axis.vertical;
    double marginTop = getAlignment(orientation) == Alignment.bottomCenter
        ? 0
        : MediaQuery.of(context).padding.top;

    return Align(
      alignment: getAlignment(orientation),
      child: Material(
        color: widget.backgroundColor,
        child: Container(
          height: height,
          width: width,
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

  Alignment getAlignment(NativeDeviceOrientation orientation) {
    if (orientation == NativeDeviceOrientation.landscapeLeft)
      return Alignment.centerRight;
    else
      return (orientation == NativeDeviceOrientation.landscapeRight)
          ? Alignment.centerLeft
          : Alignment.bottomCenter;
  }

  Widget _buildTabItem({
    NavigationBarItem item,
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
          onTap: () => onPressed(index),
          child: Icon(iconData, color: color, size: widget.iconSize),
        ),
      ),
    );
  }
}
