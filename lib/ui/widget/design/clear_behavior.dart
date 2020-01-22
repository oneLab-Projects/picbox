import 'package:flutter/widgets.dart';

/// [ClearBehavior] является наследованием от [ScrollBehavior], отключающий
/// эффект столкновения при скроллинге.
class ClearBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
