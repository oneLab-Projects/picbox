import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/decorations/input.dart';
import 'package:picbox/src/common/widgets.dart';
import 'package:picbox/src/pages/landing/confirm.dart';

/// Страница `Регистрация`
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _checkedRules = false;

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: 'Sign Up',
      body: Column(
        children: <Widget>[
          _buildProfilePhotoSelect(context),
          _buildFirstNameField(context),
          _buildLastNameField(context),
          _buildSwitch(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: URaisedButton(
              "Done",
              onPressed: !_checkedRules
                  ? null
                  : () => Navigator.push(
                      context, UPageRoute(builder: (context) => ConfirmPage())),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitch() {
    return UListSwitch(
      "I love hentai",
      value: _checkedRules,
      onChanged: (value) => setState(() => _checkedRules = value),
    );
  }

  Widget _buildLastNameField(BuildContext context) {
    return UListContent(
      "Last name (optionally)",
      child: TextField(
        autocorrect: false,
        decoration: InputDesign(
          context,
          hintText: "Exp. Who",
        ),
      ),
    );
  }

  Widget _buildFirstNameField(BuildContext context) {
    return UListContent(
      "First name",
      child: TextField(
        autocorrect: false,
        decoration: InputDesign(
          context,
          hintText: "Exp. Povar",
        ),
      ),
    );
  }

  Widget _buildProfilePhotoSelect(BuildContext context) {
    return UListContent(
      "Profile photo",
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
