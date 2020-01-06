import 'package:flutter/material.dart';
import 'package:picbox/src/common/components/list/widget.dart';
import 'package:picbox/src/common/components/switch.dart' as c;

/// Создаёт переключатель, предназначенный для отображения
/// в списке.
class ListSwitch extends StatefulWidget {
  ListSwitch(
    this.caption, {
    this.description,
    this.iconData,
    this.onChanged,
    this.value,
  });

  @required
  final String caption;
  final String description;
  final IconData iconData;
  final Function(bool) onChanged;
  @required
  final bool value;

  @override
  _ListSwitchState createState() => _ListSwitchState();
}

class _ListSwitchState extends State<ListSwitch> {
  @override
  Widget build(BuildContext context) {
    return ListWidget(
      widget.caption,
      description: widget.description,
      iconData: widget.iconData,
      onTap: widget.onChanged == null
          ? null
          : () => widget.onChanged(!widget.value),
      control: c.Switch(widget.value),
    );
  }
}
