import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';
import 'package:picbox/src/common/decorations/input.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            _buildSearchBar(context),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: 185,
              margin: EdgeInsets.only(top: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(context) {
    return TextField(
      autocorrect: false,
      decoration: RoundInputDesign(
        context,
        hintText: 'Search',
      ),
    );
  }
}
