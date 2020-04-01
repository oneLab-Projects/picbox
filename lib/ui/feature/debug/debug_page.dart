import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:pansy_ui/pansy_ui/util/device.dart';
import 'package:picbox/ui/feature/splash/code_input_sheet.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:picbox/ui/global/rxdart_test/bloc/bloc.dart';
import 'package:provider/provider.dart';

/// Страница `Для разработчиков`.
class DebugPage extends StatefulWidget {
  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  TestBloc _counterBloc;
  bool _testedTransparentSystemNavbar = false;

  @override
  Widget build(BuildContext context) {
    _counterBloc = Provider.of<TestBloc>(context);
    return UScaffold(
      title: 'debug.title'.tr(),
      body: Column(
        children: <Widget>[
          UListContent(
            "State",
            variant: true,
            child: _buildStateApp(),
          ),
          UListContent(
            "RxDart",
            variant: true,
            child: _buildTestRxDart(),
          ),
          UListContent(
            "Other",
            variant: true,
            child: _buildOther(context),
          ),
        ],
      ),
    );
  }

  Widget _buildOther(BuildContext context) {
    return Column(
      children: <Widget>[
        UListButton(
          "Open splash",
          onPressed: () => showScaffoldSheet(context, child: CodeInputSheet()),
        ),
        UListSwitch(
          "Test transparent system navbar",
          value: _testedTransparentSystemNavbar,
          onChanged: testingTransparentSystemNavbar,
        ),
      ],
    );
  }

  Widget _buildStateApp() {
    return Column(
      children: <Widget>[
        UListWidget(
          "isPhone",
          description: Device.isPhone ? "true" : "false",
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTestRxDart() {
    return Column(
      children: <Widget>[
        UListWidget(
          "Type event",
          description: _counterBloc.isIncrement ? "Increment" : "Decrement",
          control: USwitchVisual(_counterBloc.isIncrement),
          onPressed: testRxDartSwitch,
        ),
        UListWidget(
          "Send event",
          onPressed: () {
            if (_counterBloc.isIncrement)
              _counterBloc.increment();
            else
              _counterBloc.decrement();
          },
          control: StreamBuilder(
            stream: _counterBloc.subjectCounter,
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          ),
        ),
      ],
    );
  }

  void testRxDartSwitch() =>
      setState(() => _counterBloc.isIncrement = !_counterBloc.isIncrement);

  void testingTransparentSystemNavbar(bool value) {
    setState(() => _testedTransparentSystemNavbar = value);
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
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      );
    }
  }
}
