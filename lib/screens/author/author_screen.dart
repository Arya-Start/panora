import 'package:flutter/material.dart';
import 'package:panora/models/response.dart';
import 'package:panora/provider/author_provider.dart';
import 'package:panora/themes/themes.dart';
import 'package:provider/provider.dart';

import '../exit_dialog.dart';
import 'author_detail.dart';

class AuthorScreen extends StatefulWidget {
  @override
  _AuthorScreenState createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  bool isHome = true;
  bool isDetail = true;
  int idx;

  Future<bool> _goHome() {
    setState(() {
      if (!isDetail) {
        isDetail = !isDetail;
      } else {
        isHome = !isHome;
      }
    });
    return Future.value(false);
  }

  void goToAuthorDetail({int index}) {
    print("Second");
    setState(() {
      isHome = !isHome;
      idx = index;
    });
  }

  void goToBookDetail() {
    print("Third");
    setState(() {
      isDetail = !isDetail;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getAuthors();
  }

  void getAuthors() async {
    await Provider.of<AuthorProvider>(context).fetchAuthor();
    setState(() {});
    print("'Don't Call me twice");
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

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthorProvider>(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: isHome
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                  title: Text(
                    'Author',
                    style: kTitleText,
                  ),
                ),
                body: verticalList(ap, context),
              )
            : isDetail
                ? AuthorDetail(
                    author: ap.getAuthor()[idx],
                    onBack: _onBackPressed,
                    onNext: goToBookDetail,
                  )
                : Center(
                    child: Text('Book Detail'),
                  ),
      ),
    );
  }

  Widget verticalList(AuthorProvider ap, context) {
    return ap.isHas()
        ? ap.getAuthor().length > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: ap.getAuthor().length,
                itemBuilder: (context, i) {
                  return authorCart(ap.getAuthor(), i, context);
                },
              )
            : Center(child: Text('No Author'))
        : Center(child: Text('Please wait...'));
  }

  Widget authorCart(List<Author> items, int index, context) {
    return GestureDetector(
      onTap: () {
        goToAuthorDetail(index: index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage("${items[index].profileImg}"),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(items[index].name),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
