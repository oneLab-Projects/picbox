import 'package:picbox/component/routes.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:pansy_ui/pansy_ui.dart';

/// Страница `Регистрация`.
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _checkedRules = false;

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: 'signup.title'.tr(),
      body: Column(
        children: <Widget>[
          _buildProfilePhotoSelect(context),
          _buildFirstNameField(context),
          _buildLastNameField(context),
          _buildSwitch(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: URaisedButton(
              'default.done'.tr(),
              onPressed: !_checkedRules
                  ? null
                  : () => Navigator.pushNamed(context, Routes.LANDING_CONFIRM),
            ),
          ),
        ],
      ),
    );
  }

  /// Создаёт переключатель.
  Widget _buildSwitch() {
    return UListSwitch(
      "I love hentai",
      value: _checkedRules,
      onChanged: (value) => setState(() => _checkedRules = value),
    );
  }

  /// Создаёт поле ввода фамилии.
  Widget _buildLastNameField(BuildContext context) {
    return UListContent(
      'signup.last_name'.tr(),
      child: TextField(
        autocorrect: false,
        decoration: InputDesign(
          context,
          hintText: 'signup.last_name_example'.tr(),
        ),
      ),
    );
  }

  /// Создаёт поле ввода имени.
  Widget _buildFirstNameField(BuildContext context) {
    return UListContent(
      'signup.first_name'.tr(),
      child: TextField(
        autocorrect: false,
        decoration: InputDesign(
          context,
          hintText: 'signup.first_name_example'.tr(),
        ),
      ),
    );
  }

  /// Создаёт виджет выбора фотографии.
  Widget _buildProfilePhotoSelect(BuildContext context) {
    return UListContent(
      'signup.profile_photo'.tr(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            height: 65,
            width: 65,
            child: Icon(MdiIcons.camera),
          ),
          for (int i = 0;
              i <
                  (MediaQuery.of(context).orientation == Orientation.portrait
                      ? 4
                      : 8);
              i++)
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              height: 65,
              width: 65,
            ),
        ],
      ),
    );
  }
}
