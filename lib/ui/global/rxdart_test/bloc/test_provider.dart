import 'package:flutter/material.dart';

import 'bloc.dart';

class TestProvider extends InheritedWidget {
  final TestBloc bloc = TestBloc();
  bool updateShouldNotify(_) => true;

  TestProvider({Key key, Widget child}) : super(key: key, child: child);

  static TestBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TestProvider) as TestProvider)
        .bloc;
  }
}
