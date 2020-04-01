import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:picbox/component/languages.dart';
import 'package:provider/provider.dart';

import 'rxdart_test/bloc/bloc.dart';

/// [AggregateData] является виджетом, цель которого – предоставить данные
/// BLoC-билдеров, необходимые для MaterialApp, а также подключить поддержку
/// мультиязычности.
class AggregateData extends StatelessWidget {
  final Widget Function(BuildContext context, AggregateDataModel initData)
      builder;
  final String pathToLanguages;

  AggregateData({
    @required this.builder,
    @required this.pathToLanguages,
  }) : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    print(context.toString());
    var localizationsBloc = LocalizationsBloc(Languages.all);
    var themeBloc = ThemeBloc(dayTheme: dayTheme, nightTheme: nightTheme);

    return MultiProvider(
      providers: [
        ProxyProvider0<LocalizationsBloc>(
          update: (_, __) => localizationsBloc,
        ),
        ProxyProvider0<ThemeBloc>(
          update: (_, __) => themeBloc,
        ),
        Provider<TestBloc>(
          create: (_) => TestBloc(),
        ),
      ],
      child: StreamBuilder(
        stream: localizationsBloc.isLoaded,
        builder: (context, AsyncSnapshot<bool> status) {
          //
          // если localizationsBloc не готов – выводим пурпурный экран
          if (status != null && status.hasData && status?.data == true)
            return StreamBuilder(
              stream: themeBloc.theme,
              builder: (context, AsyncSnapshot<ThemeData> theme) {
                //
                // если themeBloc не готов – выводим оранжевый экран
                if (theme != null && theme.hasData && theme?.data != null) {
                  AggregateDataModel initData = AggregateDataModel(theme.data);
                  return EasyLocalization(
                    useOnlyLangCode: true,
                    supportedLocales:
                        localizationsBloc.supportedLocales.keys.toList(),
                    path: pathToLanguages,
                    child: builder(context, initData),
                  );
                } else {
                  return Container(color: Colors.orange);
                }
              },
            );
          else
            return Container(color: Colors.purple);
        },
      ),
    );
  }
}

/// Модель представления данных для [AggregateData].
class AggregateDataModel {
  ThemeData themeData;

  AggregateDataModel(this.themeData);
}
