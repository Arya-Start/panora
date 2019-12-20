import 'package:panora/imp.dart';
import 'package:transparent_image/transparent_image.dart';

import 'sliver_book_detail.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Book> bookItems = [
      Book(
          title: 'Game Of Throne',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody),
      Book(
          title: 'Man',
          author: 'bg',
          imgUrl: 'https://picsum.photos/id/98/200/300',
          page: 234,
          size: '6x9',
          price: 8200,
          category: '',
          body: kBody),
      Book(
          title: 'Hello',
          author: 'helo',
          imgUrl: 'https://picsum.photos/id/8/200/300',
          page: 123,
          size: '6x9',
          price: 8900,
          category: '',
          body: kBody),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'PANORA',
          style: kTitleText,
        ),
      ),
      body: SingleChildScrollView(
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
            horizontalList(bookItems),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Latesd Books',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            horizontalList(bookItems)
          ],
        ),
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
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: items[idx].getImgUrl,
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
