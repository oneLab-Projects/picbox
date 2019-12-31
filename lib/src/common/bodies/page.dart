import 'package:flutter/material.dart';
import 'package:picbox/src/common/components/buttons/icon.dart' as c;

class PageBody extends StatefulWidget {
  PageBody({this.title, this.child});

  final String title;
  final Widget child;

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox.expand(
        child: Stack(children: [
          content(context),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(150),
            height: MediaQuery.of(context).padding.top,
          )
        ]),
      ),
    );
  }

  content(context) {
    return Column(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).padding.top),
        titleBar(context),
        SingleChildScrollView(child: widget.child),
      ],
    );
  }

  titleBar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          c.IconButton(
            onTap: () => Navigator.pop(context),
            iconData: Icons.arrow_back,
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }
}
