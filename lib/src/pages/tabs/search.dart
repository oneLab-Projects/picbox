import 'dart:math';

import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      child: Column(
        children: <Widget>[
          _buildSearchBar(context),
          _buildTagBar(context),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 185,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(context) {
    return TextField(
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        filled: true,
        hintStyle: TextStyle(fontSize: 17, height: 1.33),
        fillColor: Theme.of(context).highlightColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
      ),
    );
  }

  Widget _buildTagBar(context) {
    final random = Random();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 40,
      child: Row(
        children: <Widget>[
          for (var i = 0; i < 3; i++)
            Container(
              width: 80 + random.nextInt(30).toDouble(),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
        ],
      ),
    );
  }
}
