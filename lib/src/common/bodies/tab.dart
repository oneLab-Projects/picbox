import 'package:flutter/material.dart';

class TabBody extends StatefulWidget {
  final String title;
  final Widget child;
  TabBody({this.title, this.child});

  @override
  _TabBodyState createState() => _TabBodyState();
}

class _TabBodyState extends State<TabBody> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: widget.title == null
                ? content(context)
                : contentWithTitleBar(context),
          ),
          Container(
            height: 50 + MediaQuery.of(context).viewInsets.bottom,
            color: Colors.grey[850],
          ),
        ],
      ),
    );
  }

  contentWithTitleBar(context) {
    return Stack(
      children: <Widget>[
        titleBar(context),
        NotificationListener<ScrollNotification>(
          onNotification: (scrollState) {
            if (scrollState is ScrollUpdateNotification &&
                (70 - scrollState.metrics.pixels) >= 0) {
              setState(() {
                _scrollPosition =
                    (70 - scrollState.metrics.pixels) * 100 / 70 / 100;
              });
            } else if (scrollState is ScrollUpdateNotification &&
                (70 - scrollState.metrics.pixels) < 0)
              setState(() => _scrollPosition = 0);

            if (scrollState is ScrollEndNotification &&
                (70 - scrollState.metrics.pixels) > 0) {
              double step = 0;
              if (_scrollPosition > 0 && _scrollPosition < 0.6) step = 70;

              Future.delayed(Duration(milliseconds: 1), () {}).then((s) =>
                  _scrollController.animateTo(step,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease));
            }

            return false;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 90, 20, 20),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }

  content(context) {
    return SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(20), child: widget.child),
    );
  }

  titleBar(context) {
    return Opacity(
      opacity: _scrollPosition,
      child: Padding(
        padding: EdgeInsets.fromLTRB(25 - (_scrollPosition * 5), 20, 20, 20),
        child: Row(
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 23 - -_scrollPosition * 3),
            ),
          ],
        ),
      ),
    );
  }
}
