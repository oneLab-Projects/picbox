import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/bodies/tab.dart';
import 'package:picbox/src/common/components/list/button.dart';
import 'package:picbox/src/common/components/list/switch.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      child: Column(
        children: <Widget>[
          _buildHead(context),
          SizedBox(height: 20),
          Divider(),
          _buildBody(context),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        ListButton(AppLocalizations.of(context).tr('profile.edit_profile'),
            iconData: MdiIcons.accountEdit),
        _buildThemeSwitch(),
      ],
    );
  }

  _buildThemeSwitch() {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, theme) => ListSwitch(
        AppLocalizations.of(context).tr('profile.night_theme'),
        iconData: MdiIcons.weatherNight,
        value: theme == themeNight,
        onChanged: (bool value) =>
            BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.toggle),
      ),
    );
  }

  _buildHead(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          height: 70,
          width: 70,
          margin: EdgeInsets.symmetric(vertical: 15),
        ),
        Column(
          children: <Widget>[
            Text("Oleg Tinkoff", style: Theme.of(context).textTheme.title),
            SizedBox(height: 4),
            Text(
              "@tinkoffoleg",
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Theme.of(context).hintColor),
            )
          ],
        ),
      ],
    );
  }
}
