import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panora/models/book.dart';

class BookDetail extends StatefulWidget {
  final Book book;
  BookDetail({@required this.book});
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black38),
        title: Text(
          'Book Detail',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 180,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    widget.book.getImgUrl,
                    width: 130,
                    height: 150,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Book Title'),
                          flex: 1,
                        ),
                        Expanded(flex: 1, child: Text(widget.book.getTitle)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Author'),
                          flex: 1,
                        ),
                        Expanded(flex: 1, child: Text(widget.book.getAuthor)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Pages'),
                          flex: 1,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(widget.book.getPage.toString())),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Size'),
                          flex: 1,
                        ),
                        Expanded(flex: 1, child: Text(widget.book.getSize)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Category'),
                          flex: 1,
                        ),
                        Expanded(flex: 1, child: Text(widget.book.getCategory)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Price'),
                          flex: 1,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(widget.book.getPrice.toString())),
                      ],
                    ),
                    RaisedButton(child: Text('Add To Cart'), onPressed: () {})
                  ],
                ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(child: Text(widget.book.getBody)),
          ))
        ],
      ),
    );
  }
}
