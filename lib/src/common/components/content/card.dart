import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentCard extends StatelessWidget {
  ContentCard(
    this.title, {
    this.description,
    this.urlImage,
    this.color,
    this.textColor,
    this.height,
    this.width,
  });

  @required
  final String title;
  final String description;
  final Color color;
  final Color textColor;
  final String urlImage;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return _buildBody(
      context,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            if (urlImage != null) _buildBackgroundImage(),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: (color ?? Colors.black).withOpacity(0.3),
              ),
            ),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCaption(context),
          if (description != null) _buildDescription(context),
        ],
      ),
    );
  }

  Widget _buildCaption(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.title.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textColor ?? Theme.of(context).textTheme.title.color,
          ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Opacity(
        opacity: 0.7,
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: textColor ?? Theme.of(context).textTheme.title.color,
              ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return SizedBox.expand(
      child: FadeInImage.memoryNetwork(
        fadeInDuration: Duration(milliseconds: 150),
        placeholder: kTransparentImage,
        image: urlImage,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildBody(BuildContext context, {Widget child}) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Material(
        color: (color ?? Theme.of(context).cardColor),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shadowColor: (color ?? Colors.black).withOpacity(0.3),
        elevation: 3,
        child: child,
      ),
    );
  }
}
