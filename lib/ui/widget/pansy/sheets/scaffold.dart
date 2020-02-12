import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Отображает диалог выбора.
/// ```dart
/// showSelectionDialog(
///   context,
///   actions: ['one', 'two', 'three'],
/// ).then(
///   (value) => print("$value tapped!"),
/// )
/// ```
Future<void> showScaffoldSheet(BuildContext context, {Widget child}) {
  return showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => ScaffoldSheet(child: child))
      .then((v) {});
}

/// Диалог выбора. Вызывается методом `showSelectionDialog`
class ScaffoldSheet extends StatelessWidget {
  final Widget child;
  ScaffoldSheet({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: child),
    );
  }
}
