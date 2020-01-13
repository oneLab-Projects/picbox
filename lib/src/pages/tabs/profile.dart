import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/widgets.dart';
import 'package:picbox/src/pages/profile/debug.dart';
import 'package:picbox/src/pages/profile/settings.dart';

/// Вкладка `Профиль`
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      body: Column(
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
        _buildProfileViewButton(context),
        Divider(),
        _buildThemeSwitch(),
        UListButton(AppLocalizations.of(context).tr('settings.title'),
            iconData: MdiIcons.settings,
            onPressed: () => Navigator.push(
                context, UPageRoute(builder: (context) => SettingsPage()))),
        Divider(),
        UListButton(AppLocalizations.of(context).tr('debug.title'),
            iconData: MdiIcons.bug,
            onPressed: () => Navigator.push(
                context, UPageRoute(builder: (context) => DebugPage()))),
      ],
    );
  }

  Widget _buildProfileViewButton(BuildContext context) => UListContent(
        AppLocalizations.of(context).tr('profile.storage'),
        iconData: MdiIcons.archive,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for (int i = 0;
                i <
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? 4
                        : 8);
                i++)
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                height: 85,
                width: 85,
              ),
          ],
        ),
      );

  Widget _buildThemeSwitch() {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, theme) => UListSwitch(
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
            borderRadius: const BorderRadius.all(Radius.circular(50)),
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
