import 'package:flutter/material.dart';
import 'package:panora/models/author.dart';
import 'package:panora/models/book.dart';
import 'package:panora/screens/search_bar.dart';
import 'package:panora/themes/themes.dart';

import 'bookdetailwithsilver.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Book> boookItems = [
      Book(
          'Game Of Throne',
          'Jhon Snow',
          1500,
          240,
          '8x34',
          'War',
          'https://prodimage.images-bn.com/pimages/9780525520412_p0_v3_s550x406.jpg',
          kBody),
      Book('Freedom from fear hhhhhhhh', 'Aung Sun Su Kyi', 4500, 240, '8x34',
          'War', 'https://picsum.photos/id/81/200/300', kBody),
      Book('See You At The Top', 'Saw Pout', 500, 20, '8x34', 'War',
          'https://picsum.photos/id/82/200/300', kBody),
      Book('DJ Soda', 'A Girl', 1500, 240, '8x34', 'War',
          'https://picsum.photos/id/85/200/300', kBody),
      Book('Android System', 'Sithu Paing', 8000, 240, '8x34', 'War',
          'https://picsum.photos/id/89/200/300', kBody),
    ];
    List<Author> authors = [
      Author('Chit OO Nyo', List<Book>()),
      Author('Ko Tar', List<Book>()),
      Author('Jhon Smith', List<Book>()),
      Author('Tar Yar Min Wai', List<Book>()),
      Author('Min Lu', List<Book>()),
      Author('Dr Ma Tin Win', List<Book>()),
      Author('Nyo Mya', List<Book>()),
      Author('Shwe Au Down', List<Book>()),
      Author('U Nyi Pu', List<Book>()),
      Author('Min Kheit Soe San', List<Book>()),
      Author('Aung San Su Kyi', List<Book>()),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          SearchText(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Popular Books',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          horizontalList(boookItems),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Latesd Books',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          horizontalList(boookItems)
        ],
      ),
    );
  }
}

Widget verticalList(List<Author> items) {
  return Expanded(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return authorCart(items, i);
      },
    ),
  );
}

Widget horizontalList(List<Book> items) {
  return Container(
    height: 240,
    child: ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return bookCart(items, i, context);
      },
    ),
  );
}

Widget bookCart(List<Book> items, int idx, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MBookDetail(
                      book: items[idx],
                    )));
      },
      child: Container(
        width: 130.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  items[idx].getImgUrl,
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                items[idx].getTitle,
                maxLines: 1,
                style: kTitleTextStyle,
              ),
            ),
            //Text(items[idx].getAuthor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                items[idx].getPrice.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget authorCart(List<Author> items, int idx) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      items[idx].getName,
      style: TextStyle(fontSize: 18),
    ),
  );
}
