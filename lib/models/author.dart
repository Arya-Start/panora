import 'package:panora/models/book.dart';

class Author {
  String _name;
  List<Book> _books;

  Author(this._name, this._books);

  List<Book> get getBooks => _books;

  set books(List<Book> value) {
    _books = value;
  }

  String get getName => _name;

  set name(String value) {
    _name = value;
  }
}
