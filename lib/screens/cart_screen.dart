import 'package:flutter/material.dart';
import 'package:panora/models/cart.dart';
import 'package:panora/themes/themes.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final booklist = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Shopping Cart',
          style: kTitleText,
        ),
      ),
      body: Container(
        child: booklist.getBookList.length > 0
            ? ListView.builder(
                itemCount: booklist.getBookList.length,
                itemBuilder: (context, idx) {
                  return buildCard(booklist, idx);
                })
            : Text('Add Itme First!'),
      ),
    );
  }

  Card buildCard(Cart booklist, int i) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Title')),
              Expanded(flex: 1, child: Text(booklist.getBookList[i].getTitle)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Price')),
              Expanded(
                  flex: 1,
                  child: Text(booklist.getBookList[i].getPrice.toString())),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('Quantity')),
              Expanded(
                  flex: 1,
                  child: Text(booklist.getBookList[i].getQuantity.toString())),
            ],
          ),
        ],
      ),
    );
  }
}
