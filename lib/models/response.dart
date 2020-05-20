class Response {
  List<Book> _books;
  List<Author> _authors;

  Response({List<Book> books, List<Author> authors}) {
    this._books = books;
    this._authors = authors;
  }

  List<Book> get getBooks {
    return _books == null ? [] : _books;
  }

  set setBooks(List<Book> books) => _books = books;

  List<Author> get getAuthors {
    return _authors == null ? [] : _authors;
  }

  set setAuthors(List<Author> authors) => _authors = authors;

  Response.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      _books = new List<Book>();
      json['books'].forEach((v) {
        _books.add(new Book.fromJson(v));
      });
    }
    if (json['authors'] != null) {
      _authors = new List<Author>();
      json['authors'].forEach((v) {
        _authors.add(new Author.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._books != null) {
      data['books'] = this._books.map((v) => v.toJson()).toList();
    }
    if (this._authors != null) {
      data['authors'] = this._authors.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void clear() {
    _books.clear();
    _authors.clear();
  }
}

class Author {
  int _id;
  String _name;
  String _profileImg;

  Author({int id, String name, String profileImg}) {
    this._id = id;
    this._name = name;
    this._profileImg = profileImg;
  }

  int get getId => _id;
  set setId(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get profileImg => _profileImg;
  set profileImg(String profileImg) => _profileImg = profileImg;

  Author.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['profileImg'] = this._profileImg;
    return data;
  }
}

class Book {
  int _id;
  String _title;
  String _imgUrl;

  Book({int id, String title, String imgUrl}) {
    this._id = id;
    this._title = title;
    this._imgUrl = imgUrl;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get imgUrl => _imgUrl;
  set imgUrl(String imgUrl) => _imgUrl = imgUrl;

  Book.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['imgUrl'] = this._imgUrl;
    return data;
  }
}
