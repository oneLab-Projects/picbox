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
          hintStyle: Theme.of(context).textTheme.subhead.copyWith(
                fontSize: 17,
                color: Theme.of(context).textTheme.caption.color,
              ),
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
