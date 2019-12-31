import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/bodies/tab.dart';
import 'package:picbox/src/common/components/list/button.dart';
import 'package:picbox/src/common/components/list/switch.dart';
import 'package:picbox/src/common/design/route.dart';
import 'package:picbox/src/pages/profile/debug.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      child: Column(
        children: <Widget>[
          _buildHead(context),
          const SizedBox(height: 20),
          Divider(),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        ListButton(AppLocalizations.of(context).tr('profile.edit_profile'),
            iconData: MdiIcons.accountEdit),
        _buildThemeSwitch(),
        Divider(),
        ListButton(AppLocalizations.of(context).tr('debug.title'),
            iconData: MdiIcons.bug,
            onTap: () => Navigator.push(
                context, RouteDesign(builder: (context) => DebugPage()))),
      ],
    );
  }

  Widget _buildThemeSwitch() {
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

  Widget _buildHead(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          height: 70,
          width: 70,
          margin: const EdgeInsets.symmetric(vertical: 15),
        ),
        Column(
          children: <Widget>[
            Text("Oleg Tinkoff", style: Theme.of(context).textTheme.title),
            const SizedBox(height: 4),
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
