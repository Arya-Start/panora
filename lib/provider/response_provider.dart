import 'dart:convert';

import 'package:panora/imp.dart';
import 'package:panora/models/response.dart';
import 'package:panora/requests/api_requests.dart';

class ResponseProvider with ChangeNotifier {
  Response response;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchData(query) async {
    setLoading(true);
    print('Query :: $query');
    await ApiRequest().mSearch(query).then((data) {
      setLoading(false);
      print('You Should not loading...');

      if (data.statusCode == 200) {
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
}
