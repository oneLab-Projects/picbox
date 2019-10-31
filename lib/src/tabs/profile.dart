import 'package:flutter/material.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/common/bodies/tab.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return TabBody(
      title: "Profile",
      child: Column(
        children: <Widget>[
          FlatButton(
              child: Text('Dark Theme'),
              onPressed: () => _themeChanger.setTheme(ThemeData.dark())),
          FlatButton(
              child: Text('Light Theme'),
              onPressed: () => _themeChanger.setTheme(ThemeData.light())),
        ],
      ),
    );
  }
}
