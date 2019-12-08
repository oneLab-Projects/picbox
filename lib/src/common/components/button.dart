import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function onTap;

  Button({this.text, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Theme.of(context).primaryColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (text != null)
                Padding(
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
                ),
              if (iconData != null)
                Icon(
                  iconData,
                  color: onTap == null
                      ? Theme.of(context).disabledColor.withAlpha(150)
                      : Theme.of(context).disabledColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
