import 'package:flutter/foundation.dart';
import 'package:panora/imp.dart';

class Book with ChangeNotifier {
  String title;
  String author;
  int price;
  int page;
  String size;
  String category;
  String imgUrl;
  String body;
  int quantity;
  int _subtotal;

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
  int get getSubTotal => _subtotal;
  set setSubTotal(int value) {
    _subtotal = value;
  }

  String get getCategory => category;

  set setCategory(String value) {
    category = value;
    notifyListeners();
  }

  String get getSize => size;

  set setSize(String value) {
    size = value;
  }

  int get getPage => page;

  set setPage(int value) {
    page = value;
  }

  int get getPrice => price;

  set setPrice(int value) {
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
