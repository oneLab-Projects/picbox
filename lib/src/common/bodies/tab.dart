import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:picbox/src/common/design/colors.dart';

class TabBody extends StatefulWidget {
  final String title;
  final Widget child;
  TabBody({this.title, this.child});

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
      child: Column(
        children: [
          Expanded(
            child: widget.title == null
                ? content(context)
                : contentWithTitleBar(context),
          ),
          Container(
            height: 50 + MediaQuery.of(context).viewInsets.bottom,
            color: ColorPalette.bottomNavigation,
          ),
        ],
      ),
    );
  }

  contentWithTitleBar(context) {
    return Stack(
      children: <Widget>[
        titleBar(context),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: _scrollPosition > 0
                ? -_scrollPosition * 8 + 8
                : _scrollPosition,
            sigmaY: _scrollPosition > 0
                ? -_scrollPosition * 8 + 8
                : _scrollPosition,
          ),
          child: NotificationListener<ScrollNotification>(
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
                padding: EdgeInsets.fromLTRB(14 + (2 * _scrollPosition), 80,
                    14 + (2 * _scrollPosition), 23),
                child: widget.child,
              ),
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
        padding: EdgeInsets.all(25),
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