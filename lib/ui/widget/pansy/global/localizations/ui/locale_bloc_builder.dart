import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../localizations_delegates.dart';

/// [LocaleBlocBuilder] является виджетом, содержавший в себе Provider и Builder
/// BLoC, предназначенного для смены локализации приложения.
class LocaleBlocBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      Locale locale,
      List<Locale> supportedLocales,
      List<LocalizationsDelegate> localizationsDelegates) builder;

  LocaleBlocBuilder({@required this.builder}) : assert(builder != null);

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
