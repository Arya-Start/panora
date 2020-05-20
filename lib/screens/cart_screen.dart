import 'package:flutter/material.dart';
import 'package:panora/imp.dart';
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
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      for (var i = 0; i < booklist.getBookList.length; i++)
                        buildCard(booklist, i)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Total Price')),
                        Expanded(
                            flex: 1,
                            child: Text(booklist.getTotalPrice.toString())),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: Text(
                'Add Item First!',
                style: kEmptyTextStyle,
              )),
      ),
    );
  }

  Card buildCard(Cart booklist, int i) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(
            booklist.getBookList[i].getImgUrl,
            width: 40,
            height: 60,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text('Title')),
                      Expanded(flex: 1, child: Text('Price')),
                      Expanded(flex: 1, child: Text('Quantity')),
                      Expanded(flex: 1, child: Text('SubTotal')),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(booklist.getBookList[i].getTitle)),
                      Expanded(
                          flex: 1,
                          child: Text(
                              booklist.getBookList[i].getPrice.toString())),
                      Expanded(
                        flex: 1,
                        child: Text(
                            booklist.getBookList[i].getQuantity.toString()),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                            booklist.getBookList[i].getSubTotal.toString()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
