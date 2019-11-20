import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/blocs/navbar.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class DebugTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: 'Debug',
      child: Column(
        children: <Widget>[
          _themeSwitchBuilder(),
          _navigationBarTestBuilder(),
        ],
      ),
    );
  }

  _themeSwitchBuilder() {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, theme) => SwitchListTile(
        title: Text('Night Theme'),
        value: theme == themeNight(),
        onChanged: (bool value) =>
            BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.toggle),
        secondary: Icon(MdiIcons.weatherNight),
      ),
    );
  }

  _navigationBarTestBuilder() {
    return BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) => Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('ResetEvent'),
                      onPressed: () =>
                          BlocProvider.of<NavbarBloc>(context).add(Reset()),
                    ),
                    RaisedButton(
                      child: Text('ShowEvent (search)'),
                      onPressed: () => BlocProvider.of<NavbarBloc>(context)
                          .add(Show(target: NavbarTarget.search)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(state.toString()),
                ),
              ],
            ));
  }
}
