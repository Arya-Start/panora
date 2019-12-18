class Book {
  String _title;
  String _author;
  double _price;
  int _page;
  String _size;
  String _category;
  String _imgUrl;
  String _body;

  Book(this._title, this._author, this._price, this._page, this._size,
      this._category, this._imgUrl, this._body);

  String get getCategory => _category;

  set category(String value) {
    _category = value;
  }

  String get getSize => _size;

  set size(String value) {
    _size = value;
  }

  int get getPage => _page;

  set page(int value) {
    _page = value;
  }

  double get getPrice => _price;

  set price(double value) {
    _price = value;
  }

  String get getAuthor => _author;

  set author(String value) {
    _author = value;
  }

  String get getTitle => _title;

  set title(String value) {
    _title = value;
  }

  String get getImgUrl => _imgUrl;

  set imgUrl(String value) {
    _imgUrl = value;
  }

  String get getBody => _body;

  set body(String value) {
    _body = value;
  }
}
