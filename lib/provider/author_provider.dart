import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:panora/models/response.dart';
import 'package:panora/requests/api_requests.dart';

class AuthorProvider with ChangeNotifier {
  List<Author> authors;
  String message;
  bool loading;

  Future<bool> fetchAuthor() async {
    setLoading(true);
    await ApiRequest().getAuthors().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        if (isHas()) {
          authors = [];
        }
        Iterable list = json.decode(data.body);
        authors = list.map((model) => Author.fromJson(model)).toList();
        setAuthors(authors);
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']);
      }
    });

    return isHas();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setAuthors(value) {
    authors = value;
    notifyListeners();
  }

  List<Author> getAuthor() {
    return authors;
  }

  void setMessage(value) {
    message = value;
    notifyListeners();
  }

  String getMessage() {
    return message;
  }

  bool isHas() {
    return authors != null ? true : false;
  }

  void clear() {
    if (isHas()) {
      authors = [];
      notifyListeners();
    }
  }
}
