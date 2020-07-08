import 'package:flutter/material.dart';
import 'package:panora/models/book.dart';
import 'package:panora/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

class BookDetail extends StatefulWidget {
  final Book book;

  const BookDetail({this.book});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  var genres = ["History", "Biography", "Haha", "hehe", "hoho"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    color: Color(0xFFECF0F1),
                    height: 260,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildBookSideCard(),
                              SizedBox(
                                width: 10,
                              ),
                              buildTitleSideCard()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        buildAddToCartBtn()
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Text(
                  "Descriptions",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 5, right: 30),
                  child: Divider(
                    height: 1,
                    thickness: 1.0,
                    color: Colors.black,
                  )),
              Container(
                 margin: EdgeInsets.only(left: 35, top: 5, right: 30),
                child: Text(kBody1))
            ],
          ),
        ),
      ),
    );
  }

  Container buildAddToCartBtn() {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: RaisedButton(
          color: Color(0xFF3498db),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            "Add To Card",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          onPressed: () {}),
    );
  }

  Card buildBookSideCard() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: widget.book.getImgUrl,
        height: 150.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Expanded buildTitleSideCard() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "ရေသေအိုင်",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("လင်းခါး"),
          SizedBox(
            height: 5,
          ),
          Text(
            "5000 ks",
            style: TextStyle(color: Color(0xff2ecc71), fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Size          -         5.6x1.2 inches",
              style: TextStyle(color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          Text("Pages      -        176"),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Genre     -      "),
              Expanded(
                child: Container(
                  height: 20,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: genres
                        .map((e) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                e,
                                style: TextStyle(color: Colors.black),
                              )),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
