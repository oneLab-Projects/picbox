import 'package:flutter/material.dart';
import 'package:picbox/common/bodies/tab_body.dart';

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
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
        ],
      ),
    );
  }
}
