import 'package:picbox/component/routes.dart';
import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

/// Страница `Подтверждение`.
class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  bool _loading = false;
  String _code;

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: AppLocalizations.of(context).tr('confirm.title'),
      body: _buildBody(
        context,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).tr('confirm.sms'),
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 20),
          _buildCodeFill(context),
          const SizedBox(height: 20),
          URaisedButton(
            AppLocalizations.of(context).tr('default.confirm'),
            loading: _loading,
            onPressed: null,
          ),
        ],
      ),
    );
  }

  /// Создаёт поле ввода для кода подтверждения.
  Widget _buildCodeFill(BuildContext context) => Stack(
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
                  height: 50,
                  width: 65,
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

  /// Основа для страницы.
  Widget _buildBody(context, {List<Widget> children}) => ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: 300, minHeight: MediaQuery.of(context).size.height / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      );

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
