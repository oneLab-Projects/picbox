import 'package:flutter/material.dart';
import 'package:picbox/component/routes.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

class CodeInputSheet extends StatefulWidget {
  @override
  _CodeInputSheetState createState() => _CodeInputSheetState();
}

class _CodeInputSheetState extends State<CodeInputSheet> {
  bool _loading = false;
  String _code;

  @override
  Widget build(BuildContext context) {
    return ScaffoldSheet(
      title: AppLocalizations.of(context).tr('confirm.title'),
      description: AppLocalizations.of(context).tr('confirm.description'),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 15),
        child: _buildCodeFill(context),
      ),
    );
  }

  /// Создаёт поле ввода для кода подтверждения.
  Widget _buildCodeFill(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            for (int i = 0; i < 4; i++)
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                height: 45,
                width: 55,
              ),
          ],
        ),
        PinFieldAutoFill(
            decoration: UnderlineDecoration(
                lineHeight: 0,
                color: Colors.transparent,
                textStyle: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.body1.color)),
            currentCode: _code,
            codeLength: 4,
            onCodeChanged: (value) {
              if (_loading) return;
              if (value.length == 4) _checkCode(value);
            }),
      ],
    );
  }

  /// Проверяем код подтверждения.
  void _checkCode(String code) async {
    setState(() => _loading = true);

    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      Routes.ROOT,
      ModalRoute.withName('/'),
    );
    await Future.delayed(Duration(milliseconds: 300));
    setState(() => _loading = false);
  }
}
