class Response {
  List<Books> _books;
  List<Authors> _authors;

  Response({List<Books> books, List<Authors> authors}) {
    this._books = books;
    this._authors = authors;
  }

  List<Books> get getBooks => _books;
  set setBooks(List<Books> books) => _books = books;

  List<Authors> get getAuthors => _authors;
  set setAuthors(List<Authors> authors) => _authors = authors;

  Response.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      _books = new List<Books>();
      json['books'].forEach((v) {
        _books.add(new Books.fromJson(v));
      });
    }
    if (json['authors'] != null) {
      _authors = new List<Authors>();
      json['authors'].forEach((v) {
        _authors.add(new Authors.fromJson(v));
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
}

class Books {
  int _id;
  String _name;
  String _profileImg;

  Books({int id, String name, String profileImg}) {
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

  Books.fromJson(Map<String, dynamic> json) {
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

class Authors {
  int _id;
  String _title;
  String _imgUrl;

  Authors({int id, String title, String imgUrl}) {
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

  Authors.fromJson(Map<String, dynamic> json) {
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
