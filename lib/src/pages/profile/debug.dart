import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:picbox/src/common/widgets.dart';
import 'package:picbox/src/pages/landing/signin.dart';

/// Страница `Для разработчиков`
class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: AppLocalizations.of(context).tr('debug.title'),
      body: Column(
        children: <Widget>[
          UListButton(
            "Open SignIn page",
            onPressed: () => Navigator.of(context, rootNavigator: true)
                .pushReplacement(
                    UPageRoute(builder: (context) => SignInPage())),
          ),
        ],
      ),
    );
  }
}
