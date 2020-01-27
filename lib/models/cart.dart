import 'package:flutter/foundation.dart';
import 'package:panora/imp.dart';

class Cart with ChangeNotifier {
  List<Book> _bookList = [];
  int _totalPrice = 0;

  List<Book> get getBookList => _bookList;

  set setBookList(List<Book> value) {
    _bookList = value;
    notifyListeners();
  }

  void addBook(Book book) {
    _bookList.add(book);
  }

  void setTotalPrice(int price, int quantity) {
    _totalPrice += price * quantity;
    notifyListeners();
  }

  get getTotalPrice => _totalPrice;
  @override
  String toString() {
    return 'Cart{bookList: $_bookList}';
  }
}
