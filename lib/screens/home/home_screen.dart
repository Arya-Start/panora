import 'package:panora/imp.dart';
import 'package:panora/screens/home/my_search.dart';
import 'package:transparent_image/transparent_image.dart';

import '../exit_dialog.dart';
import 'book_detail.dart';
import 'home_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int idx;
  bool isHome = true;

  goToDetail({int index}) {
    isHome = !isHome;
    idx = index;
    setState(() {});
  }

  Future<bool> _onBackPressed() {
    if (isHome) {
      return showDialog(
        context: context,
        builder: (context) {
          return Exit_dialog();
        },
      );
    } else {
      return _goHome();
    }
  }

  Future<bool> _goHome() {
    setState(() {
      isHome = !isHome;
    });
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    List<Book> bookItems = [
      Book(
          title: 'Game Of Throne',
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

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body: isHome
              ? Scaffold(
                  appBar: AppBar(
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MySearch()));
                        },
                      )
                    ],
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
                        //  SearchText(),
                        HomeTitle(
                          title: 'Popular Books',
                        ),
                        horizontalList(bookItems),
                        HomeTitle(
                          title: 'Lasted Books',
                        ),
                        horizontalList(bookItems)
                      ],
                    ),
                  ),
                )
              : BookDetail(
                  book: bookItems[idx],
                  onBack: _onBackPressed,
                )),
    );
  }

  Widget bookCart(List<Book> items, int idx, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          goToDetail(index: idx);
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

  Widget horizontalList(List<Book> items) {
    return Container(
      height: 255,
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

Widget authorCart(List<Author> items, int idx) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      items[idx].getName,
      style: TextStyle(fontSize: 18),
    ),
  );
}
