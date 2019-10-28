import 'package:flutter/material.dart';

class ViewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: Center(child: Text('View')),
        ),
      ),
    );
  }
}
