import 'package:flutter/material.dart';

/// Создаёт прозрачную круглую кнопку с иконкой.
class UIconButton extends StatelessWidget {
  UIconButton({
    @required this.iconData,
    this.width = 45,
    this.height = 45,
    this.iconSize = 24,
    @required this.onPressed,
  }) : assert(iconData != null || onPressed != null);
  final GestureTapCallback onPressed;
  final IconData iconData;
  final double iconSize;
  final double width;
  final double height;

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
        onTap: onPressed,
      ),
    );
  }
}
