import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../localizations_delegates.dart';

class LocaleBlocBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      Locale locale,
      List<Locale> supportedLocales,
      List<LocalizationsDelegate> localizationsDelegates) builder;

  LocaleBlocBuilder({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationsBloc>(
      create: (BuildContext context) => LocalizationsBloc(),
      child: BlocBuilder<LocalizationsBloc, Locale>(builder: (bCtx, locale) {
        return builder(
          bCtx,
          locale,
          LocalizationsDelegates.instance.supportedLocales,
          LocalizationsDelegates.instance.localizationsDelegates,
        );
      }),
    );
  }
}
