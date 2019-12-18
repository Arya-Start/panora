import 'package:flutter/material.dart';
import 'package:panora/screens/search_bar.dart';
import 'package:panora/themes/themes.dart';

class SearchDetail extends StatefulWidget {
  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {

  final TextEditingController _filter = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildBar(context),
      body: Container(),
    );
  }

  Widget _buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TextField(
        controller: _filter,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: hintStyle,
            hintText: 'Search What You Want',
            prefixIcon: Icon(
              Icons.search,
              size: 20.0,
              color: Colors.black38,
            )),
      ),
    );

  }
}
