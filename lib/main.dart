import 'package:flutter/material.dart';
import 'package:panora/screens/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panora',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          fontFamily: 'Lato',
          scaffoldBackgroundColor: Color(0xFFF4F5F9)),
      home: WelcomeScreen(),
      //  home: WelcomeScreen(),
    );
  }
}
