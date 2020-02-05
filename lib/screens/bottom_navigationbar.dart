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
      currentIndex: index,
      selectedItemColor: Colors.black54,
      unselectedItemColor: Colors.grey,
      onTap: _onTapped,
    );
  }
}
