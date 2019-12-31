import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  @required
  final GestureTapCallback onTap;
  @required
  final IconData iconData;
  final double iconSize;
  final double width;
  final double height;

  IconButton(
      {this.width = 45,
      this.height = 45,
      this.iconData,
      this.iconSize = 24,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Icon(
          iconData,
          size: iconSize,
        ),
        onTap: onTap,
      ),
    );
  }
}
