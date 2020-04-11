import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:picbox/ui/global/rxdart_test/bloc/bloc.dart';
import 'package:provider/provider.dart';

/// Вкладка `Для Вас`.
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var content = _buildCardGrid(context);
    return UScaffold(
      showBackButton: false,
      title: 'home.title'.tr(),
      body: content,
      blurBackground: Provider.of<TestBloc>(context).backgroundBlur,
    );
  }

  /// Заполняет контент-картами.
  Widget _buildCardGrid(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(18),
      crossAxisSpacing: 17,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 17,
      crossAxisCount: Device.isPhone(context)
          ? MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.width < 800 ? 3 : 4
              : MediaQuery.of(context).size.width < 600 ? 2 : 3
          : MediaQuery.of(context).size.width < 1200 ? 4 : 5,
      children: <Widget>[
        for (int i = 0; i < 23; i++)
          ContentCard(
            title: "Карточка $i",
            description: "#тест #${10000 + Random().nextInt(89999)} #хех",
            urlImage:
                "https://loremflickr.com/300/300?random=${Random().nextInt(100)}",
            width: 140 + (MediaQuery.of(context).size.width * 0.04),
            height: 140 + (MediaQuery.of(context).size.width * 0.04),
          ),
      ],
    );
  }
}
