import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panora/screens/author_screen.dart';
import 'package:panora/screens/cart_screen.dart';
import 'package:panora/screens/home.dart';
import 'package:panora/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final inActiveColor = Colors.grey;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    AuthorScreen(),
    CartScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          )
        ],*/
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black38),
        title: Text(
          'PANORA',
          style: kTitleText,
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
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
