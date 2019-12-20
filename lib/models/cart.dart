import 'package:flutter/foundation.dart';
import 'package:panora/imp.dart';

class Cart with ChangeNotifier {
  List<Book> _bookList = [];

  List<Book> get getBookList => _bookList;

  set setBookList(List<Book> value) {
    _bookList = value;
    notifyListeners();
  }

  void addBook(Book book) {
    _bookList.add(book);
  }

  @override
  String toString() {
    return 'Cart{bookList: $_bookList}';
  }
}
