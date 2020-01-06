import 'package:flutter/material.dart';
import 'package:picbox/src/common/components/list/widget.dart';

/// Создаёт кнопку, предназначенную для отображения
/// в списке.
class ListButton extends StatelessWidget {
  ListButton(
    this.caption, {
    this.description,
    this.iconData,
    this.onTap,
    this.onLongPress,
  });

  @required
  final String caption;
  final String description;
  final IconData iconData;
  final Function onLongPress;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListWidget(
      caption,
      iconData: iconData,
      onTap: onTap,
      onLongPress: onLongPress,
      description: description,
      control: Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: Theme.of(context).textTheme.button.color,
      ),
    );
  }
}
