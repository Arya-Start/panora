import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panora/screens/bottom_navigationbar.dart';
import 'package:panora/screens/cart_screen.dart';
import 'package:panora/screens/exit_dialog.dart';
import 'package:panora/screens/genre/genrescreen.dart';
import 'book_request/request_book.dart';
import 'home/home_screen.dart';

class HostView extends StatefulWidget {
  @override
  _HostViewState createState() => _HostViewState();
}

class _HostViewState extends State<HostView> {
  int _selectedIndex = 0;

  Future<void> _onItemTapped(int index) {
    switch (index) {
      case 1:
        {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => GenreScreen()));

          break;
        }
      case 2:
        {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RequestBook()));
          break;
        }
      case 3:
        {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartScreen()));
          break;
        }
    }
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return Exit_dialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body: HomeScreen(),
          bottomNavigationBar: MyBottomNav(_selectedIndex, _onItemTapped)),
    );
  }
}
