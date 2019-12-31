import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:picbox/src/common/components/list/widget.dart';

class ListSelect extends StatelessWidget {
  ListSelect(
    this.caption, {
    this.description,
    this.value,
    this.iconData,
    this.onTap,
  });

  final String caption;
  final String description;
  final String value;
  final IconData iconData;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListWidget(caption,
        iconData: iconData,
        onTap: onTap,
        description: description,
        control: Text(
            value ?? AppLocalizations.of(context).tr('default.not_selected')));
  }
}
