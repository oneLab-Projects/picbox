import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/ui/global/theme/bloc/bloc.dart';

class ThemeBlocBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  ThemeBlocBuilder({@required this.builder});

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
