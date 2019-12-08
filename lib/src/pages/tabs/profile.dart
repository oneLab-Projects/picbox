import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      child: Column(
        children: <Widget>[
          _buildHead(context),
          Divider(height: 50),
          _buildTabsBar(context),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildTabsBar(context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: 10),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        children: <Widget>[
          for (var i = 0; i < 6; i++)
            Container(
              width: 90,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
        ],
      ),
    );
  }

  GridView _buildBody(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(15),
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
    );
  }

  Padding _buildHead(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            height: 70,
            width: 70,
            margin: EdgeInsets.symmetric(vertical: 15),
          ),
          Column(
            children: <Widget>[
              Text("Oleg Tinkoff", style: Theme.of(context).textTheme.title),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "@tinkoffoleg",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
