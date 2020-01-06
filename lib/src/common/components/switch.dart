import 'package:flutter/material.dart';

/// Создаёт визуальный элемент переключателя.
class Switch extends StatefulWidget {
  Switch(this.value);
  final bool value;

  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: 30,
      height: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          color: (widget.value
              ? Theme.of(context).primaryColor
              : Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
