import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: "For You",
      child: GridView.count(
        crossAxisSpacing: 12,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        children: <Widget>[
          for (var i = 0; i < 13; i++)
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
        ],
      ),
    );
  }
}
