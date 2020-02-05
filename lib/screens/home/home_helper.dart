import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$title',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}
