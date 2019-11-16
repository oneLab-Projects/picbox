import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:picbox/src/common/components/navigation_bar.dart';

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
    return NativeDeviceOrientationReader(builder: (context) {
      NativeDeviceOrientation orientation =
          NativeDeviceOrientationReader.orientation(context);
      return Padding(
        padding: getPadding(orientation),
        child: SafeArea(
          child: widget.title == null
              ? content(context)
              : contentWithTitleBar(context),
        ),
      );
    });
  }

  EdgeInsets getPadding(NativeDeviceOrientation orientation) {
    if (orientation == NativeDeviceOrientation.landscapeLeft)
      return EdgeInsets.only(
          right: NavigationBar.weightNavigationBarHorisontal);
    else if (orientation == NativeDeviceOrientation.landscapeRight)
      return EdgeInsets.only(left: NavigationBar.weightNavigationBarHorisontal);
    else
      return EdgeInsets.zero;
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
              padding: EdgeInsets.fromLTRB(14 + (2 * _scrollPosition), 80,
                  14 + (2 * _scrollPosition), 23),
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
