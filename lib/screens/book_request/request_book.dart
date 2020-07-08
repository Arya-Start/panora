import 'package:flutter/material.dart';
import 'package:panora/themes/themes.dart';

class RequestBook extends StatefulWidget {
  @override
  _RequestBookState createState() => _RequestBookState();
}

class _RequestBookState extends State<RequestBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF0F1),
      appBar: AppBar(
        title: Text("Request Book"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: buildRequestForm()),
    );
  }
}

Widget buildRequestForm() {
  return Form(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "မှာယူလိုသူ အမည်",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Container(
            height: 35,
            child: TextFormField(
            
              decoration: InputDecoration(
                filled: true,
            
                fillColor: Color(0xFFbdc3c7),
                contentPadding:
                     EdgeInsets.only(left: 14.0,bottom: 20),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "မှာယူလိုသော စာအုပ်",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFbdc3c7),
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "စာရေးသူ အမည်",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFbdc3c7),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "ဖုန်းနံပါတ်",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFbdc3c7),
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 10),
          const Text(
            "အရေအတွက်",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  constraints: BoxConstraints.expand(width: 20, height: 20),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.zero,
                  icon: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                  onPressed: () {}),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("2")),
              IconButton(
                  constraints: BoxConstraints.expand(width: 20, height: 20),
                  alignment: Alignment.centerLeft,
                  iconSize: 10,
                  padding: EdgeInsets.zero,
                  icon: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {}),
            ],
          ),
          SizedBox(height: 30),
          Container(
            height: 45,
            child: RaisedButton(
                color: Color(0xFF3498db),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                onPressed: () {},
                child: Text(
                  "Request",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ),
  );
}
