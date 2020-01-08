import 'package:flutter/material.dart';

/// Создаёт визуальный элемент переключателя.
class USwitchVisual extends StatefulWidget {
  USwitchVisual(this.value);
  final bool value;

  @override
  _USwitchVisualState createState() => _USwitchVisualState();
}

class _USwitchVisualState extends State<USwitchVisual> {
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
