import 'package:flutter/material.dart';

class RoundInputDesign extends InputDecoration {
  RoundInputDesign(
    BuildContext context, {
    String hintText,
    String prefixText,
  }) : super(
          hintText: hintText,
          prefixText: prefixText,
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          filled: true,
          hintStyle: TextStyle(fontSize: 17, height: 1.4),
          fillColor: Theme.of(context).disabledColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).hintColor,
            ),
          ),
        );
}
