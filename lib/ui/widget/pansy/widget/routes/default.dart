import 'package:flutter/material.dart';

/// Создаёт модальный маршрут для плавного перехода с одной страницы на другую.
class UPageRoute<T> extends MaterialPageRoute<T> {
  UPageRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutExpo,
          reverseCurve: Curves.easeInCirc)),
      child: child, // child is the value returned by pageBuilder
    );
  }
}
