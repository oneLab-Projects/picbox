import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  ContentCard(this.title, {this.variant = false});
  final String title;
  final bool variant;

  @override
  Widget build(BuildContext context) {
    var color = ColorG.getColor().withOpacity(0.3);
    return SizedBox(
      width: !variant ? double.infinity : 150,
      height: !variant ? double.infinity : 150,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shadowColor: color,
        elevation: 3,
        child: Stack(
          children: <Widget>[
            Image.network('https://loremflickr.com/150/150?random=' +
                Random().nextInt(1000).toString()),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                decoration: BoxDecoration(color: color),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      Random().nextInt(1000).toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorG {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(255, 100 + random.nextInt(155),
        100 + random.nextInt(55), 100 + random.nextInt(155));
  }
}
