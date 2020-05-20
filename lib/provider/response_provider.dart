import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:panora/models/response.dart';
import 'package:panora/requests/api_requests.dart';

class ResponseProvider with ChangeNotifier {
  Response response;
  String errorMessage;
  bool loading;

  Future<bool> fetchData(query) async {
    setLoading(true);
    await ApiRequest().mSearch(query).then((data) {
      setLoading(false);

      if (data.statusCode == 200) {
        if (isHas()) {
          response.clear();
        }
        setAllData(Response.fromJson(json.decode(data.body)));
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

  void setAllData(value) {
    response = value;
    notifyListeners();
  }

  Response getAllData() {
    return response;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isHas() {
    return response != null ? true : false;
  }

  void clear() {
    if (isHas()) {
      response.clear();
      notifyListeners();
    }
  }
}
