import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/src/blocs/theme/day.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/blocs/theme/theme_event.dart';
import 'package:bloc/bloc.dart';
import 'package:picbox/src/common/design/colors.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => themeDay;

  @override
  void onTransition(Transition<ThemeEvent, ThemeData> transition) {
    super.onTransition(transition);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: transition.nextState == themeNight
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: ColorPalette.bottomNavigation,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == themeNight ? themeDay : themeNight;
        break;
    }
  }
}
