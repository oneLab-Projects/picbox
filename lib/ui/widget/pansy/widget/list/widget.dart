import 'package:flutter/material.dart';

/// [UListWidget] является обёрткой для виджетов, отображаемых
/// в списках.
class UListWidget extends StatelessWidget {
  UListWidget(
    this.caption, {
    this.description,
    this.iconData,
    this.onPressed,
    this.onLongPress,
    this.control,
  });

  final String caption;
  final String description;
  final IconData iconData;
  final Function onLongPress;
  final Function onPressed;
  final Widget control;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 70),
        child: InkWell(
          onTap: onPressed,
          onLongPress: onLongPress,
          child: _buildContent(context),
        ),
      ),
    );
  }

  /// Создаёт контент виджета.
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (iconData != null) _buildIcon(context),
          if (caption != null) _buildText(context),
          if (control != null) const SizedBox(width: 20),
          if (control != null)
            Opacity(
              opacity: onPressed == null ? 0.5 : 1,
              child: control,
            ),
        ],
      ),
    );
  }

  /// Создаёт иконку виджета.
  Widget _buildIcon(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          iconData,
          size: 20,
          color: onPressed == null && control != null
              ? Theme.of(context).textTheme.button.color.withAlpha(150)
              : Theme.of(context).textTheme.button.color,
        ),
        const SizedBox(width: 18),
      ],
    );
  }

  /// Создаёт заголовок виджета.
  Widget _buildText(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            caption,
            style: Theme.of(context).textTheme.button.copyWith(
                  color: onPressed == null && control != null
                      ? Theme.of(context).textTheme.button.color.withAlpha(150)
                      : Theme.of(context).textTheme.button.color,
                ),
          ),
          if (description != null) _buildDescription(context),
        ],
      ),
    );
  }

  /// Создаёт описание виджета.
  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 6),
        Text(
          description,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: onPressed == null && control != null
                    ? Theme.of(context).textTheme.button.color.withAlpha(110)
                    : Theme.of(context).textTheme.button.color.withAlpha(170),
              ),
        ),
      ],
    );
  }
}
