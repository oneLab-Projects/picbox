import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/blocs/navbar.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/bodies/tab.dart';
import 'package:picbox/src/common/constants.dart';

class DebugTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: AppLocalizations.of(context).tr('debug.title'),
      child: Column(
        children: <Widget>[
          _languageSwitchBuilder(context),
          _navigationBarTestBuilder(),
          RaisedButton(
            child: Text('SignInPage'),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('/signin'),
          )
        ],
      ),
    );
  }

  _languageSwitchBuilder(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    var supportedLanguages = Constants.supportedLanguages;

    return EasyLocalizationProvider(
      data: data,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          supportedLanguages.length,
          (int index) {
            String locale = supportedLanguages.keys.toList()[index];
            String nameLanguage = supportedLanguages.values.toList()[index];

            return RaisedButton(
              child: Text(nameLanguage +
                  (Localizations.localeOf(context).languageCode == locale
                      ? ' {set}'
                      : '')),
              onPressed: () => data.changeLocale(Locale(locale)),
            );
          },
        ),
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
      ),
    );
  }
}
