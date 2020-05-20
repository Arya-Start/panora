import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panora/screens/bottom_navigationbar.dart';
import 'package:panora/screens/cart_screen.dart';
import 'package:panora/screens/categories.dart';

import 'author/author_screen.dart';
import 'home/home_screen.dart';

class HostView extends StatefulWidget {
  @override
  _HostViewState createState() => _HostViewState();
}

class _HostViewState extends State<HostView> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
   AuthorScreen(),
    Categories(),
    CartScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: MyBottomNav(_selectedIndex, _onItemTapped));
  }
}
