import 'package:flutter/material.dart';

class TabBody extends StatefulWidget {
  TabBody({this.title, this.child});

  final String title;
  final Widget child;

  @override
  _TabBodyState createState() => _TabBodyState();
}

class _TabBodyState extends State<TabBody> {
  static const double _animationHeight = 60;

  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox.expand(
        child: Stack(children: [
          widget.title == null
              ? content(context)
              : contentWithTitleBar(context),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(150),
            height: MediaQuery.of(context).padding.top,
          )
        ]),
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
                (_animationHeight - scrollState.metrics.pixels) >= 0) {
              setState(() {
                _scrollPosition =
                    (_animationHeight - scrollState.metrics.pixels) *
                        100 /
                        _animationHeight /
                        100;
              });
            } else if (scrollState is ScrollUpdateNotification &&
                (_animationHeight - scrollState.metrics.pixels) < 0)
              setState(() => _scrollPosition = 0);

            if (scrollState is ScrollEndNotification &&
                (_animationHeight - scrollState.metrics.pixels) > 0) {
              double step = 0;
              if (_scrollPosition > 0 && _scrollPosition < 0.6)
                step = _animationHeight;

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
              padding:
                  EdgeInsets.only(top: 60 + MediaQuery.of(context).padding.top),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }

  content(context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: widget.child,
    );
  }

  titleBar(context) {
    return Opacity(
      opacity: _scrollPosition,
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 15 - -_scrollPosition * 5,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
