import 'package:flutter/material.dart';
import 'package:panora/themes/themes.dart';
import '../exit_dialog.dart';

class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  var generes = [
    "ဝတ္ထုတို",
    "ဝတ္ထုရှည်",
    "ရသစာပေ",
    "သုတစာပေ",
    "ဘာသာရေး",
    "သမိုင်း",
    "သိပ္ပံ",
    "ကဗျာ",
    "သင်ရိုးစာအုပ်",
    "ပုံပြင်",
    "ကိုယ်တိုင်ရေး အထုပ္ပတ္တိ"
  ];
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return Exit_dialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Genres',
          style: kTitleText,
        ),
      ),
      body: verticalList(context),
    ));
  }

  Widget verticalList(context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: generes.length,
        itemBuilder: (context, i) {
          return genreCard(generes, i, context);
        });
  }

  Widget genreCard(List<String> items, int index, context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 5,),
      child: GestureDetector(
          onTap: () {
            //goToAuthorDetail(index: index);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 10),
                child: Text(
                  items[index],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              Divider(
                height: 1,
                color: Color(0xff707070).withOpacity(0.5 ),
              )
            ],
          )),
    );
  }
}
