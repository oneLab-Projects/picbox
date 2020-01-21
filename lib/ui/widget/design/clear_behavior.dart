import 'package:flutter/material.dart';

/// [ClearBehavior] является наследованием от [ScrollBehavior], отключающий
/// эффект столкновения при скроллинге.
class ClearBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
