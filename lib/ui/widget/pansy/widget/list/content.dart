import 'package:flutter/material.dart';

/// Создаёт виджет, являющийся как кнопкой с содержимым,
/// так и заголовком для содержимого, в зависимости от
/// заданного параметра `variant` (по умолчанию – кнопка).
class UListContent extends StatelessWidget {
  UListContent(
    this.caption, {
    this.description,
    this.iconData,
    this.onPressed,
    this.onLongPress,
    this.child,
    this.variant = false,
  });

  @required
  final String caption;
  final String description;
  final IconData iconData;
  final Function onLongPress;
  final Function onPressed;
  @required
  final Widget child;
  final bool variant;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 70),
      child: Stack(
        children: <Widget>[
          _buildContent(context),
          if (onPressed != null)
            Positioned.fill(
              child: Ink(
                child: InkWell(
                  onTap: onPressed,
                  onLongPress: onLongPress,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Создаёт содержимое виджета.
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          if (caption != null) _buildCaption(context),
          SizedBox(height: !variant ? 25 : 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: variant ? 0 : 22),
            child: child,
          ),
        ],
      ),
    );
  }

  /// Создаёт заголовок и описание виджета вместе.
  Widget _buildCaption(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: <Widget>[
          if (iconData != null) _buildIcon(context),
          _buildText(context),
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
          size: !variant ? 20 : 16,
          color: !variant
              ? Theme.of(context).textTheme.button.color
              : Theme.of(context).textTheme.button.color.withAlpha(140),
        ),
        const SizedBox(width: 15),
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
                  color: !variant
                      ? Theme.of(context).textTheme.button.color
                      : Theme.of(context).textTheme.button.color.withAlpha(140),
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
                color: Theme.of(context).textTheme.button.color.withAlpha(170),
              ),
        ),
      ],
    );
  }
}
