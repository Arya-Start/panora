import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:panora/screens/home_screen.dart';
import 'package:panora/themes/themes.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Container(
        child: Center(
          child: TyperAnimatedTextKit(
            //duration: Duration(seconds: 2 ),
            isRepeatingAnimation: false,
            textStyle: flashscreenTextStyle,
            text: ['PANORA'],
            alignment: Alignment.center,
          ),
          // child: Text('${controller.value.toInt()}%',style: flashscreenTextStyle,),
        ),
      ),
    );
  }
}
