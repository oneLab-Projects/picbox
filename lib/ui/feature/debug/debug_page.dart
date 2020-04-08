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
  TestBloc _testBloc;
  bool _testedTransparentSystemNavbar = false;

  @override
  Widget build(BuildContext context) {
    _testBloc = Provider.of<TestBloc>(context);
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
        UListWidget(
          "Enable background blur",
          control: USwitchVisual(_testBloc.backgroundBlur),
          onPressed: backgroundBlurSwitch,
        ),
      ],
    );
  }

  Widget _buildStateApp() {
    return Column(
      children: <Widget>[
        UListWidget(
          "isPhone",
          control: Text(Device.isPhone ? "true" : "false"),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTestRxDart() {
    return Column(
      children: <Widget>[
        UListWidget(
          "Event type",
          description: _testBloc.isIncrement ? "Increment" : "Decrement",
          control: USwitchVisual(_testBloc.isIncrement),
          onPressed: testRxDartSwitch,
        ),
        UListWidget(
          "Send event",
          onPressed: () {
            if (_testBloc.isIncrement)
              _testBloc.increment();
            else
              _testBloc.decrement();
          },
          control: StreamBuilder(
            stream: _testBloc.subjectCounter,
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          ),
        ),
      ],
    );
  }

  void testRxDartSwitch() =>
      setState(() => _testBloc.isIncrement = !_testBloc.isIncrement);

  void backgroundBlurSwitch() =>
      setState(() => _testBloc.backgroundBlur = !_testBloc.backgroundBlur);

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
