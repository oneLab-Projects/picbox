import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/bodies/page.dart';
import 'package:picbox/src/common/components/list/select.dart';
import 'package:picbox/src/common/constants.dart';
import 'package:picbox/src/common/dialogs/select.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageBody(
        title: AppLocalizations.of(context).tr('debug.title'),
        child: Column(
          children: <Widget>[
            _languageSwitchBuilder(context),
            /*_navigationBarTestBuilder(),
            RaisedButton(
              child: Text('SignInPage'),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/signin'),
            )*/
          ],
        ),
      ),
    );
  }

  _languageSwitchBuilder(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    var supportedLanguages = Constants.supportedLanguages;

    return EasyLocalizationProvider(
      data: data,
      child: ListSelect(
        AppLocalizations.of(context).tr('debug.language'),
        onTap: () => showSelectionDialog(
          context: context,
          actions: List.generate(supportedLanguages.length,
              (int index) => supportedLanguages.values.toList()[index]),
        ).then((value) {
          if (value == null) return;

          String locale = supportedLanguages.keys
              .firstWhere((key) => supportedLanguages[key] == value);
          data.changeLocale(Locale(locale));
        }),
        value: AppLocalizations.of(context).tr('lang.name'),
        iconData: MdiIcons.earth,
      ),
    );
  }
}
