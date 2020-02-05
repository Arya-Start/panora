import 'package:flutter/material.dart';
import 'package:panora/imp.dart';
import 'package:panora/models/response.dart' as res;

class AuthorDetail extends StatefulWidget {
  final res.Author author;
  final Function onBack;
  final Function onNext;

  AuthorDetail({this.author, this.onBack, this.onNext});

  @override
  _AuthorDetailState createState() => _AuthorDetailState();
}

class _AuthorDetailState extends State<AuthorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back), onPressed: widget.onBack),
            authorCart(widget.author),
            SizedBox(
              height: 10,
            ),
            _buildGridView(widget.author)
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(res.Author author) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: List.generate(20, (index) {
          return InkWell(
            onTap: widget.onNext,
            child: Card(
              elevation: 3,
              child: Text('${author.name}' ' :: $index'),
            ),
          );
        }),
      ),
    );
  }

  Widget authorCart(res.Author author) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage("${author.profileImg}"),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(author.name),
          ),
        ],
      ),
    );
  }
}
