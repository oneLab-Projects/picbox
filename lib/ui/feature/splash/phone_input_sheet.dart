import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:picbox/ui/widget/pansy.dart';

class PhoneInputSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          Text("Введите номер телефона",
              style: Theme.of(context).textTheme.title),
          const SizedBox(height: 40),
          _buildPhoneNumberTextField(context),
          const SizedBox(height: 10),
          URaisedButton(
            AppLocalizations.of(context).tr('default.continue'),
          ),
        ],
      ),
    );
  }

  /// Создаёт поле ввода номера телефона.
  Widget _buildPhoneNumberTextField(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 75,
          child: TextFormField(
            textAlign: TextAlign.center,
            autocorrect: false,
            decoration: InputDesign(
              context,
              hintText: "+ _ _ _",
            ),
            keyboardType: TextInputType.phone,
            onChanged: (String value) {},
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            autocorrect: false,
            decoration: InputDesign(
              context,
              hintText: "_ _ _  –  _ _ _ _",
            ),
            keyboardType: TextInputType.phone,
            onChanged: (String value) {},
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
