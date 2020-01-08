import 'package:flutter/material.dart';
import 'package:picbox/src/common/widgets.dart';

/// Создает визуальную основу для виджетов.
class UScaffold extends StatefulWidget {
  UScaffold({this.title, this.body, this.showBackButton = true});

  final String title;
  @required
  final Widget body;
  final bool showBackButton;

  @override
  _UScaffoldState createState() => _UScaffoldState();
}

class _UScaffoldState extends State<UScaffold> {
  static const double _animationHeight = 60;

  ScrollController _scrollController;
  double _scrollPosition = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SizedBox.expand(
          child: Stack(children: [
            if (!widget.showBackButton)
              widget.title == null
                  ? content(context)
                  : contentWithTitleBar(context),
            if (widget.showBackButton) contentWithBackButton(context),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor.withAlpha(150),
              height: MediaQuery.of(context).padding.top,
            )
          ]),
        ),
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
              child: widget.body,
            ),
          ),
        ),
      ],
    );
  }

  content(context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: widget.body,
    );
  }

  titleBar(context) {
    return Opacity(
      opacity: _scrollPosition,
      child: Padding(
        padding: EdgeInsets.only(top: 20 + MediaQuery.of(context).padding.top),
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

  contentWithBackButton(context) {
    return Column(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).padding.top),
        titleBarWithBackButton(context),
        SingleChildScrollView(child: widget.body),
      ],
    );
  }

  titleBarWithBackButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UIconButton(
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
