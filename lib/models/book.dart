import 'package:flutter/foundation.dart';
import 'package:panora/imp.dart';

class Book with ChangeNotifier {
  String title;
  String author;
  double price;
  int page;
  String size;
  String category;
  String imgUrl;
  String body;
  int quantity;

  Book(
      {this.title,
      this.author,
      this.price,
      this.page,
      this.size,
      this.category,
      this.imgUrl,
      this.body,
      this.quantity});

  String get getCategory => category;

  set setCategory(String value) {
    category = value;
  }

  String get getSize => size;

  set setSize(String value) {
    size = value;
  }

  int get getPage => page;

  set setPage(int value) {
    page = value;
  }

  double get getPrice => price;

  set setPrice(double value) {
    price = value;
  }

  String get getAuthor => author;

  set setAuthor(String value) {
    author = value;
  }

  String get getTitle => title;

  set setTitle(String value) {
    title = value;
  }

  String get getImgUrl => imgUrl;

  set setImgUrl(String value) {
    imgUrl = value;
  }

  String get getBody => body;

  int get getQuantity => quantity;

  set setQuantity(int q) {
    quantity = q;
    notifyListeners();
  }

  set setBody(String value) {
    body = value;
  }

  @override
  String toString() {
    return 'Book{title: $title, author: $author, price: $price, page: $page, size: $size, category: $category, imgUrl: $imgUrl, body: $body, quantity: $quantity}';
  }
}
