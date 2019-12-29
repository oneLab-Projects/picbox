import 'package:flutter/material.dart';
import 'package:picbox/src/common/components/list/widget.dart';
import 'package:picbox/src/common/components/switch.dart' as c;

class ListSwitch extends StatefulWidget {
  ListSwitch(
    this.caption, {
    this.description,
    this.iconData,
    this.onChanged,
    this.value,
  });

  final String caption;
  final String description;
  final IconData iconData;
  final Function(bool) onChanged;
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
      control: Opacity(
          opacity: widget.onChanged == null ? 0.5 : 1,
          child: c.Switch(widget.value)),
    );
  }
}
