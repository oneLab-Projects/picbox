import 'package:picbox/component/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// Страница `Для разработчиков`.
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
                .pushReplacementNamed(Routes.LANDING_SIGNIN),
          ),
        ],
      ),
    );
  }
}
