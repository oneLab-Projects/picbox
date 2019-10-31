import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
          SwitchListTile(
            title: Text('Night Theme'),
            value: _themeChanger.isNight,
            onChanged: (bool value) => _themeChanger.switchToNight(value),
            secondary: Icon(MdiIcons.weatherNight),
          ),
        ],
      ),
    );
  }
}
