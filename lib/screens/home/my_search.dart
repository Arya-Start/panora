import 'package:flutter/cupertino.dart';
import 'package:panora/imp.dart';
import 'package:panora/models/response.dart';
import 'package:panora/provider/response_provider.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'home_helper.dart';

class MySearch extends StatefulWidget {
  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final TextEditingController _controller = TextEditingController();

  void search(ResponseProvider response, String s) async {
    if (s.isNotEmpty) {
      await response.fetchData(s);
      setState(() {});
    } else {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<ResponseProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: TextField(
              controller: _controller,
              onChanged: (s) {
                search(response, s);
              },
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'book,author etc ...'),
              autofocus: true,
              showCursor: true,
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                },
                icon: Icon(Icons.clear))
          ],
        ),
        body: _controller.text.isEmpty
            ? Center(
                child: Text(
                  'Waiting for your search input!',
                  style: kEmptyTextStyle,
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      response.isLoading()
                          ? LinearProgressIndicator(
                              backgroundColor: Colors.lightBlue,
                            )
                          : SizedBox(
                              height: 10,
                            ),
                      HomeTitle(
                        title: 'Books',
                      ),
                      horizontalList(response.getAllData()),
                      HomeTitle(
                        title: 'Authors',
                      ),
                      verticalList(response.getAllData()),
                    ],
                  ),
                ),
              ));
  }

  Widget horizontalList(Response items) {
    final size = items.getBooks.length;
    return Container(
        height: size > 0 ? 255 : 50,
        child: size > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: items.getBooks.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return bookCart(items, i, context);
                },
              )
            : Center(child: Text('No Books')));
  }

  Widget bookCart(Response items, int idx, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          // goToDetail(index: idx);
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
                    image: items.getBooks[idx].imgUrl,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  items.getBooks[idx].title,
                  maxLines: 1,
                  style: kTitleTextStyle,
                ),
              ),
              //Text(items[idx].getAuthor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  items.getBooks[idx].title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget verticalList(Response items) {
    final size = items.getAuthors.length;
    return size > 0
        ? Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.getAuthors.length,
              itemBuilder: (context, i) {
                return authorCart(items, i);
              },
            ),
          )
        : Center(child: Text('No Author'));
  }

  Widget authorCart(Response items, int idx) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage("${items.getAuthors[idx].profileImg}"),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: RichText(
                  text: TextSpan(
                      children: highlightOccurrences(
                          items.getAuthors[idx].name, _controller.text),
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query == null || query.isEmpty) {
      return [TextSpan(text: source)];
    }

    var matches = <Match>[];
    for (final token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
      ));
    }

    return children;
  }
}
