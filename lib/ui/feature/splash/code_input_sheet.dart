import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/ui/widget/pansy.dart';

class CodeInputSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldSheet(
      title: "Введите код подтверждения",
      description:
          "На указанный номер позвонит наш робот, введите последние четыре цифры звонящего номера.",
      child: Column(
        children: <Widget>[
          _buildPhoneNumberTextField(context),
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
