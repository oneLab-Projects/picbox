import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

enum ContentCardVariant { mini, nano }

/// Создаёт карточку, предназначенную для работы с тематическими сборниками.
class ContentCard extends StatelessWidget {
  ContentCard({
    this.title,
    this.description,
    this.urlImage,
    this.color,
    this.textColor,
    this.height,
    this.width,
    this.variant,
  });

  @required
  final String title;
  final String description;
  final Color color;
  final Color textColor;
  final String urlImage;
  final double height;
  final double width;
  final ContentCardVariant variant;

  @override
  Widget build(BuildContext context) {
    return _buildBody(
      context,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            if (urlImage != null) _buildBackgroundImage(),
            if (variant != ContentCardVariant.nano) _buildContent(context),
          ],
        ),
      ),
    );
  }

  /// Создаёт содержимое карточки.
  Widget _buildContent(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (description != null && variant != ContentCardVariant.mini)
                    _buildDescription(context),
                  _buildCaption(context),
                ],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  /// Создаёт заголовок карточки.
  Widget _buildCaption(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.title.copyWith(
          fontSize: variant != ContentCardVariant.mini ? 17 : 15,
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.white),
    );
  }

  /// Создаёт описание карточки.
  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Opacity(
        opacity: 0.7,
        child: Text(
          description,
          style: Theme.of(context).textTheme.title.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor ?? Colors.white),
        ),
      ),
    );
  }

  /// Создаёт фон карточки.
  Widget _buildBackgroundImage() {
    return Material(
      child: FadeInImage.memoryNetwork(
        fadeInDuration: Duration(milliseconds: 150),
        placeholder: kTransparentImage,
        image: urlImage,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  /// Основа карточки.
  Widget _buildBody(BuildContext context, {Widget child}) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Opacity(
        opacity: variant != ContentCardVariant.nano ? 1 : 0.4,
        child: Material(
          color: color ?? Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ),
    );
  }
}
