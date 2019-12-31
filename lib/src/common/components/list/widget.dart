import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  ListWidget(
    this.caption, {
    this.description,
    this.iconData,
    this.onTap,
    this.onLongPress,
    this.control,
  });

  final String caption;
  final String description;
  final IconData iconData;
  final Function onLongPress;
  final Function onTap;
  final Widget control;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 70),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if (iconData != null) _buildIcon(context),
            if (caption != null) _buildText(context),
            if (control != null) const SizedBox(width: 20),
            if (control != null)
              Opacity(
                opacity: onTap == null ? 0.5 : 1,
                child: control,
              ),
          ],
        ),
      );

  Widget _buildIcon(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconData,
            size: 20,
            color: onTap == null && control != null
                ? Theme.of(context).textTheme.button.color.withAlpha(150)
                : Theme.of(context).textTheme.button.color,
          ),
          const SizedBox(width: 18),
        ],
      );

  Widget _buildText(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              caption,
              style: Theme.of(context).textTheme.button.copyWith(
                    color: onTap == null && control != null
                        ? Theme.of(context)
                            .textTheme
                            .button
                            .color
                            .withAlpha(150)
                        : Theme.of(context).textTheme.button.color,
                  ),
            ),
            if (description != null) _buildDescription(context),
          ],
        ),
      );

  Widget _buildDescription(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 6),
          Text(
            description,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: onTap == null && control != null
                      ? Theme.of(context).textTheme.button.color.withAlpha(110)
                      : Theme.of(context).textTheme.button.color.withAlpha(170),
                ),
          ),
        ],
      );
}
