import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// Создает визуальную основу для виджетов.
class UScaffold extends StatefulWidget {
  UScaffold({
    this.title,
    @required this.body,
    this.blurBackground = false,
    this.showBackButton = true,
  }) : assert(body != null);

  final String title;
  final Widget body;
  final bool blurBackground;
  final bool showBackButton;
  static const double titleHeight = 60;

  @override
  _UScaffoldState createState() => _UScaffoldState();
}

class _UScaffoldState extends State<UScaffold> {
  ScrollController _scrollController = ScrollController();
  CustomScrollController _backgroundScrollController = CustomScrollController();
  double _scrollPosition = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _backgroundScrollController.dispose();
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
                  ? _content(context)
                  : _contentWithTitleBar(context),
            if (widget.showBackButton) _contentWithBackButton(context),
            Opacity(
              opacity: _scrollPosition < 1 ? 1 - _scrollPosition : 0,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor.withAlpha(90),
                height: MediaQuery.of(context).padding.top,
              ),
            )
          ]),
        ),
      ),
    );
  }

  /// Создаёт [ScrollView], содержавший в себе анимированный заголовок страницы по центру.
  Widget _contentWithTitleBar(context) {
    return Stack(
      children: <Widget>[
        if (widget.blurBackground) _buildBlurBackground(context),
        _titleBar(context),
        NotificationListener<ScrollNotification>(
          onNotification: (scrollState) {
            if ((scrollState is ScrollUpdateNotification ||
                    scrollState is ScrollEndNotification) &&
                widget.blurBackground)
              _backgroundScrollController
                  .jumpToWithoutGoingIdleAndKeepingBallistic(
                      scrollState.metrics.pixels);
            if (scrollState is ScrollUpdateNotification &&
                (UScaffold.titleHeight - scrollState.metrics.pixels) >= 0) {
              setState(() {
                _scrollPosition =
                    (UScaffold.titleHeight - scrollState.metrics.pixels) *
                        100 /
                        UScaffold.titleHeight /
                        100;
              });
            } else if (scrollState is ScrollUpdateNotification &&
                (UScaffold.titleHeight - scrollState.metrics.pixels) < 0)
              setState(() => _scrollPosition = 0);

            if (scrollState is ScrollEndNotification &&
                (UScaffold.titleHeight - scrollState.metrics.pixels) > 0 &&
                _scrollPosition < 1) {
              double step = 0;
              if (_scrollPosition > 0 && _scrollPosition < 0.6)
                step = UScaffold.titleHeight;

              Future.delayed(Duration(milliseconds: 1), () {}).then((s) =>
                  _scrollController.animateTo(step,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease));
            }

            return false;
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: UScaffold.titleHeight +
                        MediaQuery.of(context).padding.top),
                widget.body,
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Создаёт размытое отражение `body`.
  Widget _buildBlurBackground(context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: _backgroundScrollController,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: UScaffold.titleHeight +
                      MediaQuery.of(context).padding.top,
                ),
                child: widget.body,
              ),
            ],
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            height: double.maxFinite,
            padding: EdgeInsets.only(
                top: UScaffold.titleHeight + MediaQuery.of(context).padding.top,
                bottom: UScaffold.titleHeight),
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  /// Создаёт [ScrollView].
  Widget _content(context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top),
          widget.body,
        ],
      ),
    );
  }

  /// Создаёт заголовок по центру.
  Widget _titleBar(context) {
    return Opacity(
      opacity: _scrollPosition < 1
          ? _scrollPosition
          : 1 - (_scrollPosition - 1) / _scrollPosition,
      child: Padding(
        padding: EdgeInsets.only(top: 20 + MediaQuery.of(context).padding.top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: _scrollPosition < 1
                  ? 1 - (1 - _scrollPosition) * 0.3
                  : 1 + (1 - _scrollPosition) / _scrollPosition * 0.15,
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Создаёт [ScrollView], содержавший в себе кнопку возврата на предыдущую страницу, и, если указано, заголовок страницы.
  Widget _contentWithBackButton(context) {
    return Column(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).padding.top),
        _titleBarWithBackButton(context),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: widget.body,
          ),
        ),
      ],
    );
  }

  /// Создаёт кнопку возврата на предыдущую страницу, и, если указано, заголовок страницы.
  Widget _titleBarWithBackButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UIconButton(
            onPressed: () => Navigator.pop(context),
            iconData: Icons.arrow_back,
          ),
          const SizedBox(width: 8),
          if (widget.title != null)
            Text(
              widget.title,
              style: Theme.of(context).textTheme.title,
            ),
        ],
      ),
    );
  }
}

class CustomScrollController extends ScrollController {
  CustomScrollController({
    double initialScrollOffset = 0.0,
    keepScrollOffset = true,
    debugLabel,
  }) : super(
            initialScrollOffset: initialScrollOffset,
            keepScrollOffset: keepScrollOffset,
            debugLabel: debugLabel);

  @override
  _SilentScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition oldPosition,
  ) {
    return _SilentScrollPosition(
      physics: physics,
      context: context,
      oldPosition: oldPosition,
      initialPixels: initialScrollOffset,
    );
  }

  void jumpToWithoutGoingIdleAndKeepingBallistic(double value) {
    assert(positions.isNotEmpty, 'ScrollController not attached.');
    for (_SilentScrollPosition position
        in new List<ScrollPosition>.from(positions))
      position.jumpToWithoutGoingIdleAndKeepingBallistic(value);
  }
}

class _SilentScrollPosition extends ScrollPositionWithSingleContext {
  _SilentScrollPosition({
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition oldPosition,
    double initialPixels,
  }) : super(
          physics: physics,
          context: context,
          oldPosition: oldPosition,
          initialPixels: initialPixels,
        );

  void jumpToWithoutGoingIdleAndKeepingBallistic(double value) {
    if (pixels != value) {
      forcePixels(value);
    }
  }
}
