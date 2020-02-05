import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';

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
                  ? _content(context)
                  : _contentWithTitleBar(context),
            if (widget.showBackButton) _contentWithBackButton(context),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor.withAlpha(150),
              height: MediaQuery.of(context).padding.top,
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
        _titleBar(context),
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
            physics: BouncingScrollPhysics(),
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

  /// Создаёт [ScrollView].
  Widget _content(context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: widget.body,
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
                widget.title,
              child: Text(
                style: Theme.of(context)
                    .textTheme
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                    .title
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
