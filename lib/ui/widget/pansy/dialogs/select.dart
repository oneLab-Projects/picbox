import 'package:picbox/ui/global/localizations/app_localizations.dart';
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
Future<String> showSelectionDialog<String>(BuildContext context,
    {List<String> actions}) {
  return showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => SelectionDialog(actions: actions));
}

/// Диалог выбора. Вызывается методом `showSelectionDialog`
class SelectionDialog extends StatelessWidget {
  final List<dynamic> actions;
  SelectionDialog({this.actions});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 270,
        constraints: BoxConstraints(maxHeight: 365),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 3)),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          actions.length,
                          (int index) =>
                              _buildActionItem(context, actions[index]))),
                ),
              ),
              Divider(height: 1),
              _buildActionItem(
                  context,
                  AppLocalizations.of(context).tr('default.cancel'),
                  Colors.redAccent,
                  false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String title,
      [Color color, returned = true]) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.grey.withAlpha(30),
        splashColor: Colors.grey.withAlpha(30),
        onTap: () => Navigator.pop(context, returned ? title : null),
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text(title,
              strutStyle: StrutStyle(
                leading: 0,
              ),
              style: Theme.of(context).textTheme.button.copyWith(color: color)),
        ),
      ),
    );
  }
}
