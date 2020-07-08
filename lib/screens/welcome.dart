import 'dart:async';

import 'package:flutter/material.dart';

import 'host.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HostView())));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth, image: AssetImage("image/logo.png"))),
      ),
    );
  }
}
