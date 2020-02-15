import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/ui/feature/splash/code_input_sheet.dart';
import 'package:pansy_ui/pansy_ui.dart';

/// Страница `Для разработчиков`.
class DebugPage extends StatefulWidget {
  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: AppLocalizations.of(context).tr('debug.title'),
      body: Column(
        children: <Widget>[
          UListButton(
            "Open splash",
            onPressed: () =>
                showScaffoldSheet(context, child: CodeInputSheet()),
          ),
          UListSwitch(
            "Test transparent system navbar",
            value: _value,
            onChanged: (value) {
              setState(() => _value = value);
              if (value) {
                SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    systemNavigationBarColor: Colors.transparent,
                  ),
                );
              } else {
                SystemChrome.setEnabledSystemUIOverlays(
                    [SystemUiOverlay.top, SystemUiOverlay.bottom]);
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    systemNavigationBarColor:
                        Theme.of(context).scaffoldBackgroundColor,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
