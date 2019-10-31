import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: "Home",
      child: GridView.count(
        crossAxisSpacing: 12,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        children: <Widget>[
          for (var i = 0; i < 13; i++)
            Container(
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
