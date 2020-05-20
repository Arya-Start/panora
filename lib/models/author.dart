import 'package:panora/imp.dart';
import 'package:panora/models/book.dart';

class Author with ChangeNotifier {
  String _name;
  List<Book> _books;

  Author();
  Author.info(this._name, this._books);

  List<Book> get getBooks => _books;

  set books(List<Book> value) {
    _books = value;
  }

  void addAuthorBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  String get getName => _name;

  set name(String value) {
    _name = value;
  }
}
