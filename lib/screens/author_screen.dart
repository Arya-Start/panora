import 'package:flutter/material.dart';

import '../imp.dart';

class AuthorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Author',
          style: kTitleText,
        ),
      ),
      body: Center(
        child: Text('Author'),
      ),
    );
  }
}
