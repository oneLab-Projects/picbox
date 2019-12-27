import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      this.text,
      { 
        this.iconData,
        this.onTap,
        this.onLongPress,
        this.loading = false
      });

  final IconData iconData;
  final bool loading;
  final Function onLongPress;
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Theme.of(context).primaryColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: loading ? null : onTap,
        onLongPress: loading ? null : onLongPress,
        child: _buildContent(context),
      ),
    );
  }

  Padding _buildContent(BuildContext context) => Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (text != null && !loading) _buildText(context),
            if (iconData != null && !loading) _buildIcon(context),
            _buildLoader(context),
          ],
        ),
      );

  Opacity _buildLoader(BuildContext context) => Opacity(
        opacity: loading ? 0.8 : 0,
        child: SizedBox(
          width: 18,
          height: 18,
          child: FlareActor(
            "assets/loader.flr",
            color: Theme.of(context).disabledColor,
            animation: "Init",
          ),
        ),
      );

  Icon _buildIcon(BuildContext context) => Icon(
        iconData,
        color: onTap == null
            ? Theme.of(context).disabledColor.withAlpha(150)
            : Theme.of(context).disabledColor,
      );

  Padding _buildText(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button.copyWith(
                color: onTap == null
                    ? Theme.of(context).disabledColor.withAlpha(150)
                    : Theme.of(context).disabledColor,
              ),
        ),
      );
}