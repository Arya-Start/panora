import 'package:flutter/material.dart';
import 'package:panora/themes/themes.dart';

import 'search_delegate.dart';

class SearchText extends StatelessWidget {
  final SearchDelegate _delegate = SearchDeleGate();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: TextField(
        onChanged: (serachStr) {},
        onTap: () {
          showSearch(context: context, delegate: _delegate);
        },
        showCursor: false,
        style: searchTextStyle,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: hintStyle,
            hintText: 'Search what you want',
            prefixIcon: Icon(
              Icons.search,
              size: 20.0,
              color: Colors.black38,
            )),
      ),
    );
  }
}
