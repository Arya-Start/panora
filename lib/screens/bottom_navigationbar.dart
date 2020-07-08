import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget {
  final int index;
  final Function _onTapped;

  MyBottomNav(this.index, this._onTapped);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 3.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          title: Text('Genres'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_from_queue),
          title: Text('Request'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Cart'),
        ),
      ],
      currentIndex: index,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: _onTapped,
    );
  }
}
