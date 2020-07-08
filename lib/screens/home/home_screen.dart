import 'package:panora/imp.dart';
import 'package:panora/screens/home/my_search.dart';
import 'package:transparent_image/transparent_image.dart';

import 'book_detail.dart';
import 'home_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    List<Book> bookItems = [
      Book(
          title: 'ယခုပဲ ပစ္စုပ္ပန်မှာနေလိုက်ပါ',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/id/23/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'MuStar Phar',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/id/44/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'EEEEEEEEEEEEE',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/id/99/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'OOOOOOOOO',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/id/222/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'Traveler',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/id/302/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'Girl',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/id/109/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'Game Of Throne',
          author: 'Jhon Snow',
          imgUrl: 'https://picsum.photos/200/300',
          page: 234,
          size: '6x9',
          price: 800,
          category: '',
          body: kBody1),
      Book(
          title: 'Man U',
          author: 'bg',
          imgUrl: 'https://picsum.photos/id/98/200/300',
          page: 234,
          size: '6x9',
          price: 8200,
          category: '',
          body: kBody1),
      Book(
          title: 'စိတ်ကျရောဂါ',
          author: 'helo',
          imgUrl: 'https://picsum.photos/id/74/200/300',
          page: 123,
          size: '6x9',
          price: 8900,
          category: '',
          body: kBody2),
      Book(
          title: 'FFFFFFF',
          author: 'helo',
          imgUrl: 'https://picsum.photos/id/77/200/300',
          page: 1993,
          size: '6x9',
          price: 2300,
          category: '',
          body: kBody1),
    ];

    return Scaffold(
        body: Scaffold(
      backgroundColor: Color(0xFFECF0F1),
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MySearch()));
              },
            )
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("image/logo.png"))),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            //  SearchText(),
            HomeTitle(
              title: 'Popular Books',
            ),
            horizontalList(bookItems),
            HomeTitle(
              title: 'Latest Books',
            ),
            horizontalList(bookItems)
          ],
        ),
      ),
     // bottomNavigationBar: MyBottomNav(_selectedIndex, _onItemTapped),
    ));
  }

  Widget bookCart(List<Book> items, int idx, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookDetail(
                  book: items[idx],
                )));
      },
      child: Container(
        width: 115.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Card(
              margin: EdgeInsets.zero,
              elevation: 4.0,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: items[idx].getImgUrl,
                height: 130.0,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                items[idx].getTitle,
                maxLines: 1,
                style: kTitleTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: Text(
                items[idx].getPrice.toString() + " ks",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget horizontalList(List<Book> items) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 200,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return bookCart(items, i, context);
        },
      ),
    );
  }
}
