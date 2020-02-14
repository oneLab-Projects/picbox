import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/ui/widget/pansy/global/theme/bloc/bloc.dart';

/// [ThemeBlocBuilder] является виджетом, содержавший в себе Provider и Builder
/// BLoC, предназначенного для смены темы приложения.
class ThemeBlocBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  ThemeBlocBuilder({@required this.builder}) : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (ctx, themeData) {
          return builder(context, themeData);
        },
      ),
    );
  }
}
