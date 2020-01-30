import 'package:http/http.dart' as http;
import 'package:panora/models/response.dart';

class ApiRequest {
  final String baseUrl = 'http://159.65.3.185:8080/pqanora';
  String s = 'http://159.65.3.185:8080/panora/api/search?q=';
  Future<http.Response> mSearch(String query) async {
    print('Query from Api : $query');
    final data =
        await http.get('http://159.65.3.185:8080/panora/api/search?q=$query');
    print("Data ::: ${data.body.toString()}");
    return data;
  }
}
