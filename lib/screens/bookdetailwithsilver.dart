import 'package:flutter/material.dart';
import 'package:panora/models/book.dart';
import 'package:panora/screens/cart_screen.dart';
import 'package:panora/themes/themes.dart';

class MBookDetail extends StatefulWidget {
  final Book book;

  MBookDetail({this.book});

  @override
  _MBookDetailState createState() => _MBookDetailState();
}

class _MBookDetailState extends State<MBookDetail> {
  var top = 0.0;
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    title: Text(
                      'Book Detail',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    expandedHeight: 290.0,
                    floating: false,
                    iconTheme: IconThemeData(color: Colors.black),
                    pinned: true,
                    snap: false,
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                          centerTitle: false,
                          title: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              //opacity: top == 80.0 ? 1.0 : 0.0,
                              opacity: 1.0,
                              child: top == 80.0
                                  ? Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black38),
                                    )
                                  : Text('')),
                          background: Padding(
                            padding:
                                const EdgeInsets.only(top: 80.0, bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, right: 8.0, left: 8.0),
                                  child: Image.network(
                                    widget.book.getImgUrl,
                                    width: 120,
                                    height: 180,
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
                                        Expanded(
                                            flex: 1,
                                            child: Text(widget.book.getTitle)),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text('Author'),
                                          flex: 1,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Text(widget.book.getAuthor)),
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
                                            child: Text(widget.book.getPage
                                                .toString())),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text('Size'),
                                          flex: 1,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Text(widget.book.getSize)),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text('Category'),
                                          flex: 1,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:
                                                Text(widget.book.getCategory)),
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
                                            child: Text(widget.book.getPrice
                                                .toString())),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text('Quantity'),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: <Widget>[
                                              _itemCount > 1
                                                  ? RawMaterialButton(
                                                      onPressed: () => setState(
                                                          () => _itemCount--),
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(Icons.remove),
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 50),
                                                      fillColor:
                                                          Colors.grey[300],
                                                    )
                                                  : RawMaterialButton(
                                                      onPressed: () {},
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(Icons.remove),
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 50),
                                                      fillColor:
                                                          Colors.grey[300],
                                                    ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3.0),
                                                child:
                                                    Text(_itemCount.toString()),
                                              ),
                                              RawMaterialButton(
                                                onPressed: () => setState(
                                                    () => _itemCount++),
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(Icons.add),
                                                constraints: BoxConstraints(
                                                    maxWidth: 50),
                                                fillColor: Colors.grey[300],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 10),
                                            child: RaisedButton(
                                                color: Colors.amber[800],
                                                child: Text(
                                                  'Add To Cart',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartScreen()));
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ));
                    })),
              ];
            },
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Descriptions :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(kDesc),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Plot :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.book.getBody),
                ],
              ),
            ))));
  }
}
