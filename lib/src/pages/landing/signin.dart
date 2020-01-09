import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/src/common/widgets.dart';
import 'package:picbox/src/common/decorations/input.dart';
import 'package:picbox/src/pages/landing/signup.dart';

/// Страница `Авторизация`
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  int _phoneNumber;
  bool _loading = false;
  String _logoSmile = "^_^";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(
        [
          GestureDetector(
            onTap: () {
              List<String> smiles = ["^_^", "ТзТ", "U_U", "о-о", "о_о"];
              setState(
                  () => _logoSmile = smiles[Random().nextInt(smiles.length)]);
            },
            child: Text(_logoSmile,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 58,
                    color: Theme.of(context).primaryColor)),
          ),
          const SizedBox(height: 25.0),
          Text(
            "Authorize to oneLab",
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 200.0),
          _buildPhoneNumberTextField(context),
          const SizedBox(height: 10.0),
          URaisedButton(
            'Continue',
            loading: _loading,
            onPressed:
                _phoneNumber.toString().length >= 11 ? () => _continue() : null,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(List<Widget> children) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  TextFormField _buildPhoneNumberTextField(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: InputDesign(
        context,
        hintText: 'Phone Number',
        prefixText: '+7 ',
      ),
      keyboardType: TextInputType.phone,
      onChanged: (String value) {
        setState(() {
          _phoneNumber = _parsePhoneNumber(value);
        });
      },
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
        _phoneNumberFormatter,
      ],
    );
  }

  void _continue() async {
    setState(() => _loading = true);

    await Future.delayed(Duration(seconds: 2));
    setState(() => _loading = false);

    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SignUpPage()),
    );
  }

  int _parsePhoneNumber(String value) =>
      int.parse('7' + value.replaceAll(RegExp(r'[^+\d]'), ''));

  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
