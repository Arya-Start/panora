import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panora/screens/author_screen.dart';
import 'package:panora/screens/cart_screen.dart';
import 'package:panora/screens/categories.dart';
import 'package:panora/screens/home_screen.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_edit),
            title: Text('Author'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
